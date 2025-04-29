let myChart;
const colors = [
    'rgba(255, 99, 132, 0.8)',
    'rgba(54, 162, 235, 0.8)',
    'rgba(255, 206, 86, 0.8)',
    'rgba(75, 192, 192, 0.8)',
    'rgba(153, 102, 255, 0.8)',
    'rgba(255, 159, 64, 0.8)',
    'rgba(199, 199, 199, 0.8)',
    'rgba(83, 102, 255, 0.8)',
    'rgba(255, 99, 255, 0.8)',
    'rgba(99, 255, 132, 0.8)',
    'rgba(255, 132, 99, 0.8)',
    'rgba(132, 99, 255, 0.8)',
    'rgba(99, 255, 255, 0.8)',
    'rgba(255, 255, 99, 0.8)',
    'rgba(192, 75, 192, 0.8)'
];

function generateChart() {
    const chartType = document.getElementById('chartType').value;
    const showGrid = document.getElementById('grid').checked;
    const xMin = parseFloat(document.getElementById('xMin').value) || -10;
    const xMax = parseFloat(document.getElementById('xMax').value) || 10;
    const yMin = parseFloat(document.getElementById('yMin').value) || -1;
    const yMax = parseFloat(document.getElementById('yMax').value) || 1;
    const min = parseFloat(document.getElementById('min').value) || 0;
    const max = parseFloat(document.getElementById('max').value) || 100;
    let step = parseFloat(document.getElementById('step').value) || 0.1;

    if (step < 0.01) step = 0.01;
    if (xMin >= xMax || yMin >= yMax || min >= max) return;

    let labels = [];
    let datasets = [];

    if (chartType === 'pie' || chartType === 'doughnut' || chartType === 'polarArea') {
        const dataInputs = document.querySelectorAll('.data-input-field');
        labels = [];
        const data = [];
        const backgroundColors = [];

        dataInputs.forEach((input, index) => {
            const label = input.querySelector('.data-label').value || `Данные ${index + 1}`;
            const value = parseFloat(input.querySelector('.data-value').value);
            if (!isNaN(value)) {
                labels.push(label);
                data.push(value);
                backgroundColors.push(colors[index % colors.length]);
            }
        });

        if (data.length > 0) {
            datasets = [{
                data,
                backgroundColor: backgroundColors,
                borderColor: backgroundColors.map(c => c.replace('0.8', '1')),
                borderWidth: 1
            }];
        }
    } else if (chartType === 'bubble') {
        const bubbleInputs = document.querySelectorAll('.bubble-input-field');
        const bubbleData = [];
        bubbleInputs.forEach((input) => {
            const x = parseFloat(input.querySelector('.bubble-x').value);
            const y = parseFloat(input.querySelector('.bubble-y').value);
            const r = parseFloat(input.querySelector('.bubble-r').value);
            if (!isNaN(x) && !isNaN(y) && !isNaN(r)) {
                bubbleData.push({
                    x: Math.min(Math.max(x, min), max),
                    y: Math.min(Math.max(y, min), max),
                    r: Math.max(5, Math.min(100, r))
                });
            }
        });
        if (bubbleData.length > 0) {
            datasets = [{
                label: `Пузырьковая диаграмма`,
                data: bubbleData,
                backgroundColor: colors[0],
                borderColor: colors[0].replace('0.8', '1'),
                borderWidth: 1
            }];
        }
    } else if (chartType === 'scatter') {
        const functionInputs = document.querySelectorAll('.function-input');
        functionInputs.forEach((input, index) => {
            const func = input.querySelector('.function-input-field').value;
            const legend = input.querySelector('.legend-input').value || `Функция ${index + 1}`;
            if (func) {
                const scatterData = [];
                for (let x = xMin; x <= xMax; x += step) {
                    try {
                        const y = math.evaluate(func, { x });
                        if (isFinite(y) && x >= xMin && x <= xMax) {
                            scatterData.push({ x: parseFloat(x.toFixed(2)), y: Math.min(Math.max(y, yMin), yMax) });
                        }
                    } catch {}
                }
                datasets.push({
                    label: legend,
                    data: scatterData,
                    backgroundColor: colors[index % colors.length].replace('0.8', '0.2'),
                    borderColor: colors[index % colors.length].replace('0.8', '1'),
                    borderWidth: 2,
                    pointRadius: 3,
                    showLine: false
                });
            }
        });
    } else {
        for (let x = xMin; x <= xMax; x += step) {
            labels.push(parseFloat(x.toFixed(2)));
        }
        const functionInputs = document.querySelectorAll('.function-input');
        functionInputs.forEach((input, index) => {
            const func = input.querySelector('.function-input-field').value;
            const legend = input.querySelector('.legend-input').value || `Функция ${index + 1}`;
            if (func) {
                const data = labels.map(x => {
                    try {
                        const result = math.evaluate(func, { x });
                        return isFinite(result) ? Math.min(Math.max(result, yMin), yMax) : undefined;
                    } catch {
                        return undefined;
                    }
                });
                datasets.push({
                    label: legend,
                    data,
                    borderColor: colors[index % colors.length].replace('0.8', '1'),
                    backgroundColor: chartType === 'bar' ? colors[index % colors.length] : colors[index % colors.length].replace('0.8', '0.2'),
                    borderWidth: 2,
                    fill: chartType === 'line',
                    stepped: chartType === 'stepped',
                    pointRadius: 0
                });
            }
        });
    }

    const ctx = document.getElementById('myChart').getContext('2d');
    if (myChart) myChart.destroy();

    if (datasets.length > 0) {
        myChart = new Chart(ctx, {
            type: chartType === 'stepped' ? 'line' : chartType,
            data: {
                labels,
                datasets
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: chartType === 'pie' || chartType === 'doughnut' ? {} : {
                    x: {
                        display: chartType === 'line' || chartType === 'bar' || chartType === 'stepped' || chartType === 'scatter' || chartType === 'bubble',
                        title: { display: true, text: 'Ось X' },
                        grid: { display: showGrid },
                        min: chartType === 'bubble' ? min : xMin,
                        max: chartType === 'bubble' ? max : xMax
                    },
                    y: {
                        display: chartType === 'line' || chartType === 'bar' || chartType === 'stepped' || chartType === 'scatter' || chartType === 'bubble',
                        title: { display: true, text: 'Ось Y' },
                        grid: { display: showGrid },
                        min: chartType === 'bubble' ? min : yMin,
                        max: chartType === 'bubble' ? max : yMax
                    },
                    r: {
                        display: chartType === 'polarArea',
                        grid: { display: showGrid },
                        ticks: { beginAtZero: true }
                    }
                },
                plugins: {
                    legend: { 
                        display: true, 
                        position: 'top',
                        labels: {
                            boxWidth: 20,
                            padding: 10
                        }
                    },
                    title: { 
                        display: true, 
                        text: 'Конструктор диаграмм' 
                    }
                }
            }
        });
    }
}

function addFunction() {
    const functionInputs = document.querySelector('.function-inputs');
    const newInput = document.createElement('div');
    newInput.className = 'function-input';
    newInput.innerHTML = `
        <select class="preset-functions">
            <option value="">Выберите функцию</option>
            <option value="x^2">x^2</option>
            <option value="x^3">x^3</option>
            <option value="sqrt(x)">sqrt(x)</option>
            <option value="log(x)">log(x)</option>
            <option value="exp(x)">exp(x)</option>
            <option value="sin(x)">sin(x)</option>
            <option value="cos(x)">cos(x)</option>
            <option value="tan(x)">tan(x)</option>
            <option value="cot(x)">cot(x)</option>
            <option value="sec(x)">sec(x)</option>
            <option value="csc(x)">csc(x)</option>
            <option value="asin(x)">asin(x)</option>
            <option value="acos(x)">acos(x)</option>
            <option value="atan(x)">atan(x)</option>
            <option value="acot(x)">acot(x)</option>
            <option value="asec(x)">asec(x)</option>
            <option value="acsc(x)">acsc(x)</option>
            <option value="sinh(x)">sinh(x)</option>
            <option value="cosh(x)">cosh(x)</option>
            <option value="tanh(x)">tanh(x)</option>
            <option value="coth(x)">coth(x)</option>
        </select>
        <input type="text" class="function-input-field" placeholder="Введите функцию, например: 10x^2 - 5x + 4">
        <input type="text" class="legend-input" placeholder="Название легенды">
        <button class="remove-btn">Удалить</button>
    `;
    functionInputs.appendChild(newInput);
    newInput.querySelector('.preset-functions').addEventListener('change', applyPresetFunction);
    newInput.querySelector('.function-input-field').addEventListener('input', generateChart);
    newInput.querySelector('.legend-input').addEventListener('input', generateChart);
    newInput.querySelector('.remove-btn').addEventListener('click', () => removeFunction(newInput));
    generateChart();
}

function addDataField() {
    const dataInputs = document.querySelector('.data-inputs');
    const newInput = document.createElement('div');
    newInput.className = 'data-input-field';
    newInput.innerHTML = `
        <input type="text" class="data-label" placeholder="Метка данных">
        <input type="number" class="data-value" placeholder="Значение">
        <button class="remove-btn">Удалить</button>
    `;
    dataInputs.appendChild(newInput);
    newInput.querySelector('.data-label').addEventListener('input', generateChart);
    newInput.querySelector('.data-value').addEventListener('input', generateChart);
    newInput.querySelector('.remove-btn').addEventListener('click', () => removeDataField(newInput));
    generateChart();
}

function addBubbleField() {
    const bubbleInputs = document.querySelector('.bubble-inputs');
    const newInput = document.createElement('div');
    newInput.className = 'bubble-input-field';
    newInput.innerHTML = `
        <input type="number" class="bubble-x" placeholder="X">
        <input type="number" class="bubble-y" placeholder="Y">
        <input type="number" class="bubble-r" placeholder="R (размер)">
        <button class="remove-btn">Удалить</button>
    `;
    bubbleInputs.appendChild(newInput);
    newInput.querySelector('.bubble-x').addEventListener('input', generateChart);
    newInput.querySelector('.bubble-y').addEventListener('input', generateChart);
    newInput.querySelector('.bubble-r').addEventListener('input', generateChart);
    newInput.querySelector('.remove-btn').addEventListener('click', () => removeBubbleField(newInput));
    generateChart();
}

function removeFunction(element) {
    if (document.querySelectorAll('.function-input').length > 1) {
        element.remove();
        generateChart();
    }
}

function removeDataField(element) {
    if (document.querySelectorAll('.data-input-field').length > 1) {
        element.remove();
        generateChart();
    }
}

function removeBubbleField(element) {
    if (document.querySelectorAll('.bubble-input-field').length > 1) {
        element.remove();
        generateChart();
    }
}

function applyPresetFunction(event) {
    const select = event.target;
    const func = select.value;
    if (func) {
        select.parentElement.querySelector('.function-input-field').value = func;
        generateChart();
    }
}

function generateRandomData() {
    const chartType = document.getElementById('chartType').value;
    const min = parseFloat(document.getElementById('min').value) || 0;
    const max = parseFloat(document.getElementById('max').value) || 100;
    const step = parseFloat(document.getElementById('step').value) || 0.1;
    const dataCount = parseInt(document.getElementById('dataCount').value) || 15;

    if (chartType === 'bubble') {
        const bubbleInputs = document.querySelector('.bubble-inputs');
        bubbleInputs.innerHTML = '';
        for (let i = 0; i < dataCount; i++) {
            const x = Number((Math.random() * (max - min) + min).toFixed(step === 1 ? 0 : step === 0.1 ? 1 : 2));
            const y = Number((Math.random() * (max - min) + min).toFixed(step === 1 ? 0 : step === 0.1 ? 1 : 2));
            const r = Math.random() * 25 + 5;
            const newInput = document.createElement('div');
            newInput.className = 'bubble-input-field';
            newInput.innerHTML = `
                <input type="number" class="bubble-x" placeholder="X" value="${x}">
                <input type="number" class="bubble-y" placeholder="Y" value="${y}">
                <input type="number" class="bubble-r" placeholder="R (размер)" value="${r.toFixed(2)}">
                <button class="remove-btn">Удалить</button>
            `;
            bubbleInputs.appendChild(newInput);
            newInput.querySelector('.bubble-x').addEventListener('input', generateChart);
            newInput.querySelector('.bubble-y').addEventListener('input', generateChart);
            newInput.querySelector('.bubble-r').addEventListener('input', generateChart);
            newInput.querySelector('.remove-btn').addEventListener('click', () => removeBubbleField(newInput));
        }
    } else if (chartType === 'pie' || chartType === 'doughnut' || chartType === 'polarArea') {
        const dataInputs = document.querySelector('.data-inputs');
        dataInputs.innerHTML = '';
        for (let i = 0; i < dataCount; i++) {
            const value = Number((Math.random() * (max - min) + min).toFixed(step === 1 ? 0 : step === 0.1 ? 1 : 2));
            const newInput = document.createElement('div');
            newInput.className = 'data-input-field';
            newInput.innerHTML = `
                <input type="text" class="data-label" placeholder="Метка данных" value="Данные ${i + 1}">
                <input type="number" class="data-value" placeholder="Значение" value="${value}">
                <button class="remove-btn">Удалить</button>
            `;
            dataInputs.appendChild(newInput);
            newInput.querySelector('.data-label').addEventListener('input', generateChart);
            newInput.querySelector('.data-value').addEventListener('input', generateChart);
            newInput.querySelector('.remove-btn').addEventListener('click', () => removeDataField(newInput));
        }
    }
    generateChart();
}

function toggleInputs() {
    const chartType = document.getElementById('chartType').value;
    const functionInputs = document.querySelector('.function-inputs');
    const dataInputs = document.querySelector('.data-inputs');
    const bubbleInputs = document.querySelector('.bubble-inputs');
    const dataButton = document.querySelector('.data-input-button');
    const bubbleButton = document.querySelector('.bubble-input-button');
    const functionButton = document.querySelector('.function-input-button');
    const generateButton = document.querySelector('.generate-btn');
    const xControls = document.querySelectorAll('.x-controls');
    const yControls = document.querySelectorAll('.y-controls');
    const minControls = document.querySelectorAll('.min-controls');
    const maxControls = document.querySelectorAll('.max-controls');
    const dataCountControls = document.querySelectorAll('.data-count-controls');

    if (chartType === 'pie' || chartType === 'doughnut' || chartType === 'polarArea') {
        functionInputs.classList.add('hidden');
        dataInputs.classList.remove('hidden');
        bubbleInputs.classList.add('hidden');
        dataButton.classList.remove('hidden');
        bubbleButton.classList.add('hidden');
        functionButton.classList.add('hidden');
        generateButton.classList.remove('hidden');
        xControls.forEach(control => control.classList.add('hidden'));
        yControls.forEach(control => control.classList.add('hidden'));
        minControls.forEach(control => control.classList.remove('hidden'));
        maxControls.forEach(control => control.classList.remove('hidden'));
        dataCountControls.forEach(control => control.classList.remove('hidden'));
    } else if (chartType === 'bubble') {
        functionInputs.classList.add('hidden');
        dataInputs.classList.add('hidden');
        bubbleInputs.classList.remove('hidden');
        dataButton.classList.add('hidden');
        bubbleButton.classList.remove('hidden');
        functionButton.classList.add('hidden');
        generateButton.classList.remove('hidden');
        xControls.forEach(control => control.classList.add('hidden'));
        yControls.forEach(control => control.classList.add('hidden'));
        minControls.forEach(control => control.classList.remove('hidden'));
        maxControls.forEach(control => control.classList.remove('hidden'));
        dataCountControls.forEach(control => control.classList.remove('hidden'));
    } else {
        functionInputs.classList.remove('hidden');
        dataInputs.classList.add('hidden');
        bubbleInputs.classList.add('hidden');
        dataButton.classList.add('hidden');
        bubbleButton.classList.add('hidden');
        functionButton.classList.remove('hidden');
        generateButton.classList.add('hidden');
        xControls.forEach(control => control.classList.remove('hidden'));
        yControls.forEach(control => control.classList.remove('hidden'));
        minControls.forEach(control => control.classList.add('hidden'));
        maxControls.forEach(control => control.classList.add('hidden'));
        dataCountControls.forEach(control => control.classList.add('hidden'));
    }
    generateChart();
}

document.getElementById('chartType').addEventListener('change', toggleInputs);
document.getElementById('xMin').addEventListener('input', generateChart);
document.getElementById('xMax').addEventListener('input', generateChart);
document.getElementById('yMin').addEventListener('input', generateChart);
document.getElementById('yMax').addEventListener('input', generateChart);
document.getElementById('min').addEventListener('input', generateChart);
document.getElementById('max').addEventListener('input', generateChart);
document.getElementById('step').addEventListener('input', generateChart);
document.getElementById('dataCount').addEventListener('input', generateChart);
document.getElementById('grid').addEventListener('change', generateChart);
document.querySelectorAll('.preset-functions').forEach(select => select.addEventListener('change', applyPresetFunction));
document.querySelectorAll('.function-input-field').forEach(input => input.addEventListener('input', generateChart));
document.querySelectorAll('.legend-input').forEach(input => input.addEventListener('input', generateChart));
document.querySelectorAll('.function-input .remove-btn').forEach(btn => btn.addEventListener('click', () => removeFunction(btn.parentElement)));
document.querySelectorAll('.data-input-field').forEach(field => {
    field.querySelector('.data-label')?.addEventListener('input', generateChart);
    field.querySelector('.data-value')?.addEventListener('input', generateChart);
    field.querySelector('.remove-btn')?.addEventListener('click', () => removeDataField(field));
});
document.querySelectorAll('.bubble-input-field').forEach(field => {
    field.querySelector('.bubble-x')?.addEventListener('input', generateChart);
    field.querySelector('.bubble-y')?.addEventListener('input', generateChart);
    field.querySelector('.bubble-r')?.addEventListener('input', generateChart);
    field.querySelector('.remove-btn')?.addEventListener('click', () => removeBubbleField(field));
});

window.onload = toggleInputs;