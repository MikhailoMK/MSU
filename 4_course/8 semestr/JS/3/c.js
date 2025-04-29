document.getElementById('shapeSelector').addEventListener('change', function() {
    const shape = this.value;
    const propertiesDiv = document.getElementById('shapeProperties');
    propertiesDiv.innerHTML = '';

    switch (shape) {
        case 'square':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="side">Сторона квадрата:</label>
                    <input type="number" id="side" oninput="updateSquare('side')">
                    <button class="highlight" onmouseover="highlightSquare('side')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateSquare('perimeter')">
                    <button class="highlight" onmouseover="highlightSquare('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateSquare('area')">
                    <button class="highlight" onmouseover="highlightSquare('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'rectangle':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="length">Длина:</label>
                    <input type="number" id="length" oninput="updateRectangle('length')">
                    <button class="highlight" onmouseover="highlightRectangle('length')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="width">Ширина:</label>
                    <input type="number" id="width" oninput="updateRectangle('width')">
                    <button class="highlight" onmouseover="highlightRectangle('width')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateRectangle('perimeter')">
                    <button class="highlight" onmouseover="highlightRectangle('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateRectangle('area')">
                    <button class="highlight" onmouseover="highlightRectangle('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'circle':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="radius">Радиус круга:</label>
                    <input type="number" id="radius" oninput="updateCircle('radius')">
                    <button class="highlight" onmouseover="highlightCircle('radius')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="circumference">Длина окружности:</label>
                    <input type="number" id="circumference" oninput="updateCircle('circumference')">
                    <button class="highlight" onmouseover="highlightCircle('circumference')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateCircle('area')">
                    <button class="highlight" onmouseover="highlightCircle('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'rhombus':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="side">Сторона ромба:</label>
                    <input type="number" id="side" oninput="updateRhombus('side')">
                    <button class="highlight" onmouseover="highlightRhombus('side')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="height">Высота ромба:</label>
                    <input type="number" id="height" oninput="updateRhombus('height')">
                    <button class="highlight" onmouseover="highlightRhombus('height')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateRhombus('perimeter')">
                    <button class="highlight" onmouseover="highlightRhombus('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateRhombus('area')">
                    <button class="highlight" onmouseover="highlightRhombus('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'parallelogram':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="base">Основание:</label>
                    <input type="number" id="base" oninput="updateParallelogram('base')">
                    <button class="highlight" onmouseover="highlightParallelogram('base')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="height">Высота:</label>
                    <input type="number" id="height" oninput="updateParallelogram('height')">
                    <button class="highlight" onmouseover="highlightParallelogram('height')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateParallelogram('perimeter')">
                    <button class="highlight" onmouseover="highlightParallelogram('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateParallelogram('area')">
                    <button class="highlight" onmouseover="highlightParallelogram('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'rightTriangle':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="base">Основание:</label>
                    <input type="number" id="base" oninput="updateRightTriangle('base')">
                    <button class="highlight" onmouseover="highlightRightTriangle('base')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="height">Высота:</label>
                    <input type="number" id="height" oninput="updateRightTriangle('height')">
                    <button class="highlight" onmouseover="highlightRightTriangle('height')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateRightTriangle('perimeter')">
                    <button class="highlight" onmouseover="highlightRightTriangle('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateRightTriangle('area')">
                    <button class="highlight" onmouseover="highlightRightTriangle('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'isoscelesTriangle':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="base">Основание:</label>
                    <input type="number" id="base" oninput="updateIsoscelesTriangle('base')">
                    <button class="highlight" onmouseover="highlightIsoscelesTriangle('base')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="height">Высота:</label>
                    <input type="number" id="height" oninput="updateIsoscelesTriangle('height')">
                    <button class="highlight" onmouseover="highlightIsoscelesTriangle('height')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateIsoscelesTriangle('perimeter')">
                    <button class="highlight" onmouseover="highlightIsoscelesTriangle('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateIsoscelesTriangle('area')">
                    <button class="highlight" onmouseover="highlightIsoscelesTriangle('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'equilateralTriangle':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="side">Сторона:</label>
                    <input type="number" id="side" oninput="updateEquilateralTriangle('side')">
                    <button class="highlight" onmouseover="highlightEquilateralTriangle('side')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateEquilateralTriangle('perimeter')">
                    <button class="highlight" onmouseover="highlightEquilateralTriangle('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateEquilateralTriangle('area')">
                    <button class="highlight" onmouseover="highlightEquilateralTriangle('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'scaleneTriangle':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="side1">Сторона 1:</label>
                    <input type="number" id="side1" oninput="updateScaleneTriangle('side1')">
                    <button class="highlight" onmouseover="highlightScaleneTriangle('side1')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="side2">Сторона 2:</label>
                    <input type="number" id="side2" oninput="updateScaleneTriangle('side2')">
                    <button class="highlight" onmouseover="highlightScaleneTriangle('side2')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="side3">Сторона 3:</label>
                    <input type="number" id="side3" oninput="updateScaleneTriangle('side3')">
                    <button class="highlight" onmouseover="highlightScaleneTriangle('side3')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateScaleneTriangle('perimeter')">
                    <button class="highlight" onmouseover="highlightScaleneTriangle('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateScaleneTriangle('area')">
                    <button class="highlight" onmouseover="highlightScaleneTriangle('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'ellipse':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="majorAxis">Большая ось:</label>
                    <input type="number" id="majorAxis" oninput="updateEllipse('majorAxis')">
                    <button class="highlight" onmouseover="highlightEllipse('majorAxis')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="minorAxis">Малая ось:</label>
                    <input type="number" id="minorAxis" oninput="updateEllipse('minorAxis')">
                    <button class="highlight" onmouseover="highlightEllipse('minorAxis')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateEllipse('perimeter')">
                    <button class="highlight" onmouseover="highlightEllipse('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateEllipse('area')">
                    <button class="highlight" onmouseover="highlightEllipse('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
        case 'trapezoid':
            propertiesDiv.innerHTML = `
                <div class="switch">
                    <label for="base1">Основание 1:</label>
                    <input type="number" id="base1" oninput="updateTrapezoid('base1')">
                    <button class="highlight" onmouseover="highlightTrapezoid('base1')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="base2">Основание 2:</label>
                    <input type="number" id="base2" oninput="updateTrapezoid('base2')">
                    <button class="highlight" onmouseover="highlightTrapezoid('base2')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="height">Высота:</label>
                    <input type="number" id="height" oninput="updateTrapezoid('height')">
                    <button class="highlight" onmouseover="highlightTrapezoid('height')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="perimeter">Периметр:</label>
                    <input type="number" id="perimeter" oninput="updateTrapezoid('perimeter')">
                    <button class="highlight" onmouseover="highlightTrapezoid('perimeter')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
                <div class="switch">
                    <label for="area">Площадь:</label>
                    <input type="number" id="area" oninput="updateTrapezoid('area')">
                    <button class="highlight" onmouseover="highlightTrapezoid('area')" onmouseout="clearHighlight()">Подсветить</button>
                </div>
            `;
            break;
    }
});

function updateSquare(changedField) {
    let side = parseFloat(document.getElementById('side').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'side') {
        perimeter = side * 4;
        area = side * side;
    } else if (changedField === 'perimeter') {
        side = perimeter / 4;
        area = side * side;
    } else if (changedField === 'area') {
        side = Math.sqrt(area);
        perimeter = side * 4;
    }

    document.getElementById('side').value = side || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawSquare(side);
}

function updateRectangle(changedField) {
    let length = parseFloat(document.getElementById('length').value);
    let width = parseFloat(document.getElementById('width').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'length') {
        if (width) {
            perimeter = 2 * (length + width);
            area = length * width;
        } else if (perimeter) {
            width = (perimeter / 2) - length;
            area = length * width;
        } else if (area) {
            width = area / length;
            perimeter = 2 * (length + width);
        }
    } else if (changedField === 'width') {
        if (length) {
            perimeter = 2 * (length + width);
            area = length * width;
        } else if (perimeter) {
            length = (perimeter / 2) - width;
            area = length * width;
        } else if (area) {
            length = area / width;
            perimeter = 2 * (length + width);
        }
    } else if (changedField === 'perimeter') {
        if (length) {
            width = (perimeter / 2) - length;
            area = length * width;
        } else if (width) {
            length = (perimeter / 2) - width;
            area = length * width;
        } else if (area) {
            const discriminant = Math.sqrt(perimeter * perimeter - 16 * area);
            length = (perimeter + discriminant) / 4;
            width = (perimeter - discriminant) / 4;
        }
    } else if (changedField === 'area') {
        if (length) {
            width = area / length;
            perimeter = 2 * (length + width);
        } else if (width) {
            length = area / width;
            perimeter = 2 * (length + width);
        } else if (perimeter) {
            const discriminant = Math.sqrt(perimeter * perimeter - 16 * area);
            length = (perimeter + discriminant) / 4;
            width = (perimeter - discriminant) / 4;
        }
    }

    document.getElementById('length').value = length || '';
    document.getElementById('width').value = width || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawRectangle(length, width);
}

function updateCircle(changedField) {
    let radius = parseFloat(document.getElementById('radius').value);
    let circumference = parseFloat(document.getElementById('circumference').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'radius') {
        circumference = 2 * Math.PI * radius;
        area = Math.PI * radius * radius;
    } else if (changedField === 'circumference') {
        radius = circumference / (2 * Math.PI);
        area = Math.PI * radius * radius;
    } else if (changedField === 'area') {
        radius = Math.sqrt(area / Math.PI);
        circumference = 2 * Math.PI * radius;
    }

    document.getElementById('radius').value = radius || '';
    document.getElementById('circumference').value = circumference || '';
    document.getElementById('area').value = area || '';

    drawCircle(radius);
}

function updateRhombus(changedField) {
    let side = parseFloat(document.getElementById('side').value);
    let height = parseFloat(document.getElementById('height').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'side') {
        if (height) {
            area = side * height;
            perimeter = 4 * side;
        } else if (perimeter) {
            side = perimeter / 4;
            area = side * height;
        } else if (area) {
            height = area / side;
            perimeter = 4 * side;
        }
    } else if (changedField === 'height') {
        if (side) {
            area = side * height;
            perimeter = 4 * side;
        } else if (perimeter) {
            side = perimeter / 4;
            area = side * height;
        } else if (area) {
            side = area / height;
            perimeter = 4 * side;
        }
    } else if (changedField === 'perimeter') {
        if (side) {
            height = area / side;
        } else if (height) {
            side = perimeter / 4;
            area = side * height;
        } else if (area) {
            side = perimeter / 4;
            height = area / side;
        }
    } else if (changedField === 'area') {
        if (side) {
            height = area / side;
            perimeter = 4 * side;
        } else if (height) {
            side = area / height;
            perimeter = 4 * side;
        } else if (perimeter) {
            side = perimeter / 4;
            height = area / side;
        }
    }

    document.getElementById('side').value = side || '';
    document.getElementById('height').value = height || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawRhombus(side, height);
}

function updateParallelogram(changedField) {
    let base = parseFloat(document.getElementById('base').value);
    let height = parseFloat(document.getElementById('height').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base') {
        if (height) {
            area = base * height;
            perimeter = 2 * (base + height);
        } else if (perimeter) {
            height = (perimeter / 2) - base;
            area = base * height;
        } else if (area) {
            height = area / base;
            perimeter = 2 * (base + height);
        }
    } else if (changedField === 'height') {
        if (base) {
            area = base * height;
            perimeter = 2 * (base + height);
        } else if (perimeter) {
            base = (perimeter / 2) - height;
            area = base * height;
        } else if (area) {
            base = area / height;
            perimeter = 2 * (base + height);
        }
    } else if (changedField === 'perimeter') {
        if (base) {
            height = (perimeter / 2) - base;
            area = base * height;
        } else if (height) {
            base = (perimeter / 2) - height;
            area = base * height;
        } else if (area) {
            base = (perimeter / 2) - height;
            height = area / base;
        }
    } else if (changedField === 'area') {
        if (base) {
            height = area / base;
            perimeter = 2 * (base + height);
        } else if (height) {
            base = area / height;
            perimeter = 2 * (base + height);
        } else if (perimeter) {
            base = (perimeter / 2) - height;
            height = area / base;
        }
    }

    document.getElementById('base').value = base || '';
    document.getElementById('height').value = height || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawParallelogram(base, height);
}

function updateRightTriangle(changedField) {
    let base = parseFloat(document.getElementById('base').value);
    let height = parseFloat(document.getElementById('height').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base') {
        if (height) {
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
            area = (base * height) / 2;
        } else if (perimeter) {
            // Логика для расчета base и height на основе perimeter
        } else if (area) {
            height = (2 * area) / base;
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
        }
    } else if (changedField === 'height') {
        if (base) {
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
            area = (base * height) / 2;
        } else if (perimeter) {
            // Логика для расчета base и height на основе perimeter
        } else if (area) {
            base = (2 * area) / height;
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
        }
    } else if (changedField === 'perimeter') {
        if (base && height) {
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            area = (base * height) / 2;
        } else if (base && area) {
            height = (2 * area) / base;
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
        } else if (height && area) {
            base = (2 * area) / height;
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
        }
    } else if (changedField === 'area') {
        if (base && height) {
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
        } else if (base && perimeter) {
            height = (2 * area) / base;
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
        } else if (height && perimeter) {
            base = (2 * area) / height;
            const hypotenuse = Math.sqrt(base ** 2 + height ** 2);
            perimeter = base + height + hypotenuse;
        }
    }

    document.getElementById('base').value = base || '';
    document.getElementById('height').value = height || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawRightTriangle(base, height);
}

function updateIsoscelesTriangle(changedField) {
    let base = parseFloat(document.getElementById('base').value);
    let height = parseFloat(document.getElementById('height').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base') {
        if (height) {
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            perimeter = 2 * side + base;
            area = (base * height) / 2;
        } else if (perimeter) {
            const side = (perimeter - base) / 2;
            height = Math.sqrt(side ** 2 - (base / 2) ** 2);
            area = (base * height) / 2;
        } else if (area) {
            height = (2 * area) / base;
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            perimeter = 2 * side + base;
        }
    } else if (changedField === 'height') {
        if (base) {
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            perimeter = 2 * side + base;
            area = (base * height) / 2;
        } else if (perimeter) {
            const side = (perimeter - base) / 2;
            base = 2 * Math.sqrt(side ** 2 - height ** 2);
            area = (base * height) / 2;
        } else if (area) {
            base = (2 * area) / height;
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            perimeter = 2 * side + base;
        }
    } else if (changedField === 'perimeter') {
        if (base && height) {
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            area = (base * height) / 2;
        } else if (base && area) {
            height = (2 * area) / base;
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            perimeter = 2 * side + base;
        } else if (height && area) {
            base = (2 * area) / height;
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            perimeter = 2 * side + base;
        }
    } else if (changedField === 'area') {
        if (base && height) {
            const side = Math.sqrt((base / 2) ** 2 + height ** 2);
            perimeter = 2 * side + base;
        } else if (base && perimeter) {
            const side = (perimeter - base) / 2;
            height = Math.sqrt(side ** 2 - (base / 2) ** 2);
            area = (base * height) / 2;
        } else if (height && perimeter) {
            const side = (perimeter - base) / 2;
            base = 2 * Math.sqrt(side ** 2 - height ** 2);
            area = (base * height) / 2;
        }
    }

    document.getElementById('base').value = base || '';
    document.getElementById('height').value = height || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawIsoscelesTriangle(base, height);
}

function updateEquilateralTriangle(changedField) {
    let side = parseFloat(document.getElementById('side').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'side') {
        perimeter = 3 * side;
        area = (Math.sqrt(3) / 4) * side * side;
    } else if (changedField === 'perimeter') {
        side = perimeter / 3;
        area = (Math.sqrt(3) / 4) * side * side;
    } else if (changedField === 'area') {
        side = Math.sqrt((4 * area) / Math.sqrt(3));
        perimeter = 3 * side;
    }

    document.getElementById('side').value = side || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawEquilateralTriangle(side);
}

function updateScaleneTriangle(changedField) {
    let side1 = parseFloat(document.getElementById('side1').value);
    let side2 = parseFloat(document.getElementById('side2').value);
    let side3 = parseFloat(document.getElementById('side3').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'side1') {
        if (side2 && side3) {
            perimeter = side1 + side2 + side3;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (perimeter && side2) {
            side3 = perimeter - side1 - side2;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (area && side2) {
            const s = (side1 + side2 + side3) / 2;
            side3 = 2 * (area / (Math.sqrt(s * (s - side1) * (s - side2))));
            perimeter = side1 + side2 + side3;
        }
    } else if (changedField === 'side2') {
        if (side1 && side3) {
            perimeter = side1 + side2 + side3;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (perimeter && side1) {
            side3 = perimeter - side1 - side2;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (area && side1) {
            const s = (side1 + side2 + side3) / 2;
            side3 = 2 * (area / (Math.sqrt(s * (s - side1) * (s - side2))));
            perimeter = side1 + side2 + side3;
        }
    } else if (changedField === 'side3') {
        if (side1 && side2) {
            perimeter = side1 + side2 + side3;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (perimeter && side1) {
            side2 = perimeter - side1 - side3;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (area && side1) {
            const s = (side1 + side2 + side3) / 2;
            side2 = 2 * (area / (Math.sqrt(s * (s - side1) * (s - side3))));
            perimeter = side1 + side2 + side3;
        }
    } else if (changedField === 'perimeter') {
        if (side1 && side2 && side3) {
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (side1 && side2) {
            side3 = perimeter - side1 - side2;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (side1 && side3) {
            side2 = perimeter - side1 - side3;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        } else if (side2 && side3) {
            side1 = perimeter - side2 - side3;
            const s = perimeter / 2;
            area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
        }
    } else if (changedField === 'area') {
        if (side1 && side2 && side3) {
            const s = (side1 + side2 + side3) / 2;
            perimeter = side1 + side2 + side3;
        } else if (side1 && side2) {
            const s = (side1 + side2 + side3) / 2;
            side3 = 2 * (area / (Math.sqrt(s * (s - side1) * (s - side2))));
            perimeter = side1 + side2 + side3;
        } else if (side1 && side3) {
            const s = (side1 + side2 + side3) / 2;
            side2 = 2 * (area / (Math.sqrt(s * (s - side1) * (s - side3))));
            perimeter = side1 + side2 + side3;
        } else if (side2 && side3) {
            const s = (side1 + side2 + side3) / 2;
            side1 = 2 * (area / (Math.sqrt(s * (s - side2) * (s - side3))));
            perimeter = side1 + side2 + side3;
        }
    }

    document.getElementById('side1').value = side1 || '';
    document.getElementById('side2').value = side2 || '';
    document.getElementById('side3').value = side3 || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawScaleneTriangle(side1, side2, side3);
}

function updateEllipse(changedField) {
    let majorAxis = parseFloat(document.getElementById('majorAxis').value);
    let minorAxis = parseFloat(document.getElementById('minorAxis').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'majorAxis') {
        if (minorAxis) {
            perimeter = Math.PI * (3 * (majorAxis + minorAxis) - Math.sqrt((3 * majorAxis + minorAxis) * (majorAxis + 3 * minorAxis)));
            area = Math.PI * (majorAxis / 2) * (minorAxis / 2);
        } else if (perimeter) {
            // Логика для расчета majorAxis и minorAxis на основе perimeter
        } else if (area) {
            minorAxis = (4 * area) / (Math.PI * majorAxis);
            perimeter = Math.PI * (3 * (majorAxis + minorAxis) - Math.sqrt((3 * majorAxis + minorAxis) * (majorAxis + 3 * minorAxis)));
        }
    } else if (changedField === 'minorAxis') {
        if (majorAxis) {
            perimeter = Math.PI * (3 * (majorAxis + minorAxis) - Math.sqrt((3 * majorAxis + minorAxis) * (majorAxis + 3 * minorAxis)));
            area = Math.PI * (majorAxis / 2) * (minorAxis / 2);
        } else if (perimeter) {
            // Логика для расчета majorAxis и minorAxis на основе perimeter
        } else if (area) {
            majorAxis = (4 * area) / (Math.PI * minorAxis);
            perimeter = Math.PI * 3 * (majorAxis + minorAxis) - Math.sqrt((3 * majorAxis + minorAxis) * (majorAxis + 3 * minorAxis));
        }
    } else if (changedField === 'perimeter') {
        if (majorAxis && minorAxis) {
            area = Math.PI * (majorAxis / 2) * (minorAxis / 2);
        } else if (majorAxis && area) {
            minorAxis = (4 * area) / (Math.PI * majorAxis);
        } else if (minorAxis && area) {
            majorAxis = (4 * area) / (Math.PI * minorAxis);
        }
    } else if (changedField === 'area') {
        if (majorAxis && minorAxis) {
            perimeter = Math.PI * 3 * (majorAxis + minorAxis) - Math.sqrt((3 * majorAxis + minorAxis) * (majorAxis + 3 * minorAxis));
        } else if (majorAxis && perimeter) {
            minorAxis = (4 * area) / (Math.PI * majorAxis);
        } else if (minorAxis && perimeter) {
            majorAxis = (4 * area) / (Math.PI * minorAxis);
        }
    }

    document.getElementById('majorAxis').value = majorAxis || '';
    document.getElementById('minorAxis').value = minorAxis || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawEllipse(majorAxis, minorAxis);
}

function updateTrapezoid(changedField) {
    let base1 = parseFloat(document.getElementById('base1').value);
    let base2 = parseFloat(document.getElementById('base2').value);
    let height = parseFloat(document.getElementById('height').value);
    let perimeter = parseFloat(document.getElementById('perimeter').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base1') {
        if (base2 && height) {
            area = ((base1 + base2) / 2) * height;
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        } else if (perimeter && base2) {
            height = Math.sqrt(((perimeter - base1 - base2) / 2) ** 2 - ((base2 - base1) / 2) ** 2);
            area = ((base1 + base2) / 2) * height;
        } else if (area && base2) {
            height = (2 * area) / (base1 + base2);
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        }
    } else if (changedField === 'base2') {
        if (base1 && height) {
            area = ((base1 + base2) / 2) * height;
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        } else if (perimeter && base1) {
            height = Math.sqrt(((perimeter - base1 - base2) / 2) ** 2 - ((base2 - base1) / 2) ** 2);
            area = ((base1 + base2) / 2) * height;
        } else if (area && base1) {
            height = (2 * area) / (base1 + base2);
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        }
    } else if (changedField === 'height') {
        if (base1 && base2) {
            area = ((base1 + base2) / 2) * height;
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        } else if (perimeter && base1) {
            base2 = perimeter - base1 - 2 * Math.sqrt(((perimeter - base1) / 2) ** 2 - height ** 2);
            area = ((base1 + base2) / 2) * height;
        } else if (area && base1) {
            base2 = (2 * area) / height - base1;
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        }
    } else if (changedField === 'perimeter') {
        if (base1 && base2 && height) {
            area = ((base1 + base2) / 2) * height;
        } else if (base1 && base2) {
            height = Math.sqrt(((perimeter - base1 - base2) / 2) ** 2 - ((base2 - base1) / 2) ** 2);
            area = ((base1 + base2) / 2) * height;
        } else if (base1 && height) {
            base2 = perimeter - base1 - 2 * Math.sqrt(((perimeter - base1) / 2) ** 2 - height ** 2);
            area = ((base1 + base2) / 2) * height;
        } else if (base2 && height) {
            base1 = perimeter - base2 - 2 * Math.sqrt(((perimeter - base2) / 2) ** 2 - height ** 2);
            area = ((base1 + base2) / 2) * height;
        }
    } else if (changedField === 'area') {
        if (base1 && base2 && height) {
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        } else if (base1 && base2) {
            height = (2 * area) / (base1 + base2);
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        } else if (base1 && height) {
            base2 = (2 * area) / height - base1;
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        } else if (base2 && height) {
            base1 = (2 * area) / height - base2;
            perimeter = base1 + base2 + 2 * Math.sqrt(((base2 - base1) / 2) ** 2 + height ** 2);
        }
    }

    document.getElementById('base1').value = base1 || '';
    document.getElementById('base2').value = base2 || '';
    document.getElementById('height').value = height || '';
    document.getElementById('perimeter').value = perimeter || '';
    document.getElementById('area').value = area || '';

    drawTrapezoid(base1, base2, height);
}