document.getElementById('shapeSelector').addEventListener('change', function() {
    const shape = this.value;
    const propertiesDiv = document.getElementById('shapeProperties');
    propertiesDiv.innerHTML = '';

    switch (shape) {
        case 'square':
            propertiesDiv.innerHTML = `
                <label for="side">Сторона квадрата:</label>
                <input type="number" id="side" oninput="updateSquare('side')">
                <div class="highlight" onmouseover="highlightSquare('side')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="perimeter">Периметр:</label>
                <input type="number" id="perimeter" oninput="updateSquare('perimeter')">
                <div class="highlight" onmouseover="highlightSquare('perimeter')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateSquare('area')">
                <div class="highlight" onmouseover="highlightSquare('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'rectangle':
            propertiesDiv.innerHTML = `
                <label for="length">Длина:</label>
                <input type="number" id="length" oninput="updateRectangle('length')">
                <div class="highlight" onmouseover="highlightRectangle('length')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="width">Ширина:</label>
                <input type="number" id="width" oninput="updateRectangle('width')">
                <div class="highlight" onmouseover="highlightRectangle('width')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="perimeter">Периметр:</label>
                <input type="number" id="perimeter" oninput="updateRectangle('perimeter')">
                <div class="highlight" onmouseover="highlightRectangle('perimeter')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateRectangle('area')">
                <div class="highlight" onmouseover="highlightRectangle('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'circle':
            propertiesDiv.innerHTML = `
                <label for="radius">Радиус круга:</label>
                <input type="number" id="radius" oninput="updateCircle('radius')">
                <div class="highlight" onmouseover="highlightCircle('radius')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="circumference">Длина окружности:</label>
                <input type="number" id="circumference" oninput="updateCircle('circumference')">
                <div class="highlight" onmouseover="highlightCircle('circumference')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateCircle('area')">
                <div class="highlight" onmouseover="highlightCircle('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'triangle':
            propertiesDiv.innerHTML = `
                <label for="base">Основание:</label>
                <input type="number" id="base" oninput="updateTriangle('base')">
                <div class="highlight" onmouseover="highlightTriangle('base')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="height">Высота:</label>
                <input type="number" id="height" oninput="updateTriangle('height')">
                <div class="highlight" onmouseover="highlightTriangle('height')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateTriangle('area')">
                <div class="highlight" onmouseover="highlightTriangle('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'rhombus':
            propertiesDiv.innerHTML = `
                <label for="side">Сторона ромба:</label>
                <input type="number" id="side" oninput="updateRhombus('side')">
                <div class="highlight" onmouseover="highlightRhombus('side')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="height">Высота ромба:</label>
                <input type="number" id="height" oninput="updateRhombus('height')">
                <div class="highlight" onmouseover="highlightRhombus('height')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateRhombus('area')">
                <div class="highlight" onmouseover="highlightRhombus('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'parallelogram':
            propertiesDiv.innerHTML = `
                <label for="base">Основание:</label>
                <input type="number" id="base" oninput="updateParallelogram('base')">
                <div class="highlight" onmouseover="highlightParallelogram('base')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="height">Высота:</label>
                <input type="number" id="height" oninput="updateParallelogram('height')">
                <div class="highlight" onmouseover="highlightParallelogram('height')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateParallelogram('area')">
                <div class="highlight" onmouseover="highlightParallelogram('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'rightTriangle':
            propertiesDiv.innerHTML = `
                <label for="base">Основание:</label>
                <input type="number" id="base" oninput="updateRightTriangle('base')">
                <div class="highlight" onmouseover="highlightRightTriangle('base')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="height">Высота:</label>
                <input type="number" id="height" oninput="updateRightTriangle('height')">
                <div class="highlight" onmouseover="highlightRightTriangle('height')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateRightTriangle('area')">
                <div class="highlight" onmouseover="highlightRightTriangle('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'isoscelesTriangle':
            propertiesDiv.innerHTML = `
                <label for="base">Основание:</label>
                <input type="number" id="base" oninput="updateIsoscelesTriangle('base')">
                <div class="highlight" onmouseover="highlightIsoscelesTriangle('base')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="height">Высота:</label>
                <input type="number" id="height" oninput="updateIsoscelesTriangle('height')">
                <div class="highlight" onmouseover="highlightIsoscelesTriangle('height')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateIsoscelesTriangle('area')">
                <div class="highlight" onmouseover="highlightIsoscelesTriangle('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'equilateralTriangle':
            propertiesDiv.innerHTML = `
                <label for="side">Сторона:</label>
                <input type="number" id="side" oninput="updateEquilateralTriangle('side')">
                <div class="highlight" onmouseover="highlightEquilateralTriangle('side')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateEquilateralTriangle('area')">
                <div class="highlight" onmouseover="highlightEquilateralTriangle('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'scaleneTriangle':
            propertiesDiv.innerHTML = `
                <label for="side1">Сторона 1:</label>
                <input type="number" id="side1" oninput="updateScaleneTriangle('side1')">
                <div class="highlight" onmouseover="highlightScaleneTriangle('side1')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="side2">Сторона 2:</label>
                <input type="number" id="side2" oninput="updateScaleneTriangle('side2')">
                <div class="highlight" onmouseover="highlightScaleneTriangle('side2')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="side3">Сторона 3:</label>
                <input type="number" id="side3" oninput="updateScaleneTriangle('side3')">
                <div class="highlight" onmouseover="highlightScaleneTriangle('side3')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateScaleneTriangle('area')">
                <div class="highlight" onmouseover="highlightScaleneTriangle('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'ellipse':
            propertiesDiv.innerHTML = `
                <label for="majorAxis">Большая ось:</label>
                <input type="number" id="majorAxis" oninput="updateEllipse('majorAxis')">
                <div class="highlight" onmouseover="highlightEllipse('majorAxis')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="minorAxis">Малая ось:</label>
                <input type="number" id="minorAxis" oninput="updateEllipse('minorAxis')">
                <div class="highlight" onmouseover="highlightEllipse('minorAxis')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateEllipse('area')">
                <div class="highlight" onmouseover="highlightEllipse('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
        case 'trapezoid':
            propertiesDiv.innerHTML = `
                <label for="base1">Основание 1:</label>
                <input type="number" id="base1" oninput="updateTrapezoid('base1')">
                <div class="highlight" onmouseover="highlightTrapezoid('base1')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="base2">Основание 2:</label>
                <input type="number" id="base2" oninput="updateTrapezoid('base2')">
                <div class="highlight" onmouseover="highlightTrapezoid('base2')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="height">Высота:</label>
                <input type="number" id="height" oninput="updateTrapezoid('height')">
                <div class="highlight" onmouseover="highlightTrapezoid('height')" onmouseout="clearHighlight()"></div>
                <br>
                <label for="area">Площадь:</label>
                <input type="number" id="area" oninput="updateTrapezoid('area')">
                <div class="highlight" onmouseover="highlightTrapezoid('area')" onmouseout="clearHighlight()"></div>
            `;
            break;
    }
});

// Функции для обновления характеристик фигур
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

function updateTriangle(changedField) {
    let base = parseFloat(document.getElementById('base').value);
    let height = parseFloat(document.getElementById('height').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base') {
        if (height) {
            area = (base * height) / 2;
        } else if (area) {
            height = (2 * area) / base;
        }
    } else if (changedField === 'height') {
        if (base) {
            area = (base * height) / 2;
        } else if (area) {
            base = (2 * area) / height;
        }
    } else if (changedField === 'area') {
        if (base) {
            height = (2 * area) / base;
        } else if (height) {
            base = (2 * area) / height;
        }
    }

    document.getElementById('base').value = base || '';
    document.getElementById('height').value = height || '';
    document.getElementById('area').value = area || '';

    drawTriangle(base, height);
}

function updateRhombus(changedField) {
    let side = parseFloat(document.getElementById('side').value);
    let height = parseFloat(document.getElementById('height').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'side') {
        if (height) {
            area = side * height;
        } else if (area) {
            height = area / side;
        }
    } else if (changedField === 'height') {
        if (side) {
            area = side * height;
        } else if (area) {
            side = area / height;
        }
    } else if (changedField === 'area') {
        if (side) {
            height = area / side;
        } else if (height) {
            side = area / height;
        }
    }

    document.getElementById('side').value = side || '';
    document.getElementById('height').value = height || '';
    document.getElementById('area').value = area || '';

    drawRhombus(side, height);
}

function updateParallelogram(changedField) {
    let base = parseFloat(document.getElementById('base').value);
    let height = parseFloat(document.getElementById('height').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base') {
        if (height) {
            area = base * height;
        } else if (area) {
            height = area / base;
        }
    } else if (changedField === 'height') {
        if (base) {
            area = base * height;
        } else if (area) {
            base = area / height;
        }
    } else if (changedField === 'area') {
        if (base) {
            height = area / base;
        } else if (height) {
            base = area / height;
        }
    }

    document.getElementById('base').value = base || '';
    document.getElementById('height').value = height || '';
    document.getElementById('area').value = area || '';

    drawParallelogram(base, height);
}

function updateRightTriangle(changedField) {
    let base = parseFloat(document.getElementById('base').value);
    let height = parseFloat(document.getElementById('height').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base') {
        if (height) {
            area = (base * height) / 2;
        } else if (area) {
            height = (2 * area) / base;
        }
    } else if (changedField === 'height') {
        if (base) {
            area = (base * height) / 2;
        } else if (area) {
            base = (2 * area) / height;
        }
    } else if (changedField === 'area') {
        if (base) {
            height = (2 * area) / base;
        } else if (height) {
            base = (2 * area) / height;
        }
    }

    document.getElementById('base').value = base || '';
    document.getElementById('height').value = height || '';
    document.getElementById('area').value = area || '';

    drawRightTriangle(base, height);
}

function updateIsoscelesTriangle(changedField) {
    let base = parseFloat(document.getElementById('base').value);
    let height = parseFloat(document.getElementById('height').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base') {
        if (height) {
            area = (base * height) / 2;
        } else if (area) {
            height = (2 * area) / base;
        }
    } else if (changedField === 'height') {
        if (base) {
            area = (base * height) / 2;
        } else if (area) {
            base = (2 * area) / height;
        }
    } else if (changedField === 'area') {
        if (base) {
            height = (2 * area) / base;
        } else if (height) {
            base = (2 * area) / height;
        }
    }

    document.getElementById('base').value = base || '';
    document.getElementById('height').value = height || '';
    document.getElementById('area').value = area || '';

    drawIsoscelesTriangle(base, height);
}

function updateEquilateralTriangle(changedField) {
    let side = parseFloat(document.getElementById('side').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'side') {
        area = (Math.sqrt(3) / 4) * side * side;
    } else if (changedField === 'area') {
        side = Math.sqrt((4 * area) / Math.sqrt(3));
    }

    document.getElementById('side').value = side || '';
    document.getElementById('area').value = area || '';

    drawEquilateralTriangle(side);
}

function updateScaleneTriangle(changedField) {
    let side1 = parseFloat(document.getElementById('side1').value);
    let side2 = parseFloat(document.getElementById('side2').value);
    let side3 = parseFloat(document.getElementById('side3').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'side1' || changedField === 'side2' || changedField === 'side3') {
        const s = (side1 + side2 + side3) / 2;
        area = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
    } else if (changedField === 'area') {
        // Для площади требуется больше данных, поэтому пересчет сторон невозможен без дополнительных условий.
        // Оставьте это поле пустым или добавьте дополнительные поля для ввода.
    }

    document.getElementById('side1').value = side1 || '';
    document.getElementById('side2').value = side2 || '';
    document.getElementById('side3').value = side3 || '';
    document.getElementById('area').value = area || '';

    drawScaleneTriangle(side1, side2, side3);
}

function updateEllipse(changedField) {
    let majorAxis = parseFloat(document.getElementById('majorAxis').value);
    let minorAxis = parseFloat(document.getElementById('minorAxis').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'majorAxis') {
        if (minorAxis) {
            area = Math.PI * (majorAxis / 2) * (minorAxis / 2);
        } else if (area) {
            minorAxis = (4 * area) / (Math.PI * majorAxis);
        }
    } else if (changedField === 'minorAxis') {
        if (majorAxis) {
            area = Math.PI * (majorAxis / 2) * (minorAxis / 2);
        } else if (area) {
            majorAxis = (4 * area) / (Math.PI * minorAxis);
        }
    } else if (changedField === 'area') {
        if (majorAxis) {
            minorAxis = (4 * area) / (Math.PI * majorAxis);
        } else if (minorAxis) {
            majorAxis = (4 * area) / (Math.PI * minorAxis);
        }
    }

    document.getElementById('majorAxis').value = majorAxis || '';
    document.getElementById('minorAxis').value = minorAxis || '';
    document.getElementById('area').value = area || '';

    drawEllipse(majorAxis, minorAxis);
}

function updateTrapezoid(changedField) {
    let base1 = parseFloat(document.getElementById('base1').value);
    let base2 = parseFloat(document.getElementById('base2').value);
    let height = parseFloat(document.getElementById('height').value);
    let area = parseFloat(document.getElementById('area').value);

    if (changedField === 'base1') {
        if (base2 && height) {
            area = ((base1 + base2) / 2) * height;
        } else if (area && height) {
            base2 = (2 * area) / height - base1;
        }
    } else if (changedField === 'base2') {
        if (base1 && height) {
            area = ((base1 + base2) / 2) * height;
        } else if (area && height) {
            base1 = (2 * area) / height - base2;
        }
    } else if (changedField === 'height') {
        if (base1 && base2) {
            area = ((base1 + base2) / 2) * height;
        } else if (area && base1) {
            base2 = (2 * area) / height - base1;
        }
    } else if (changedField === 'area') {
        if (base1 && base2) {
            height = (2 * area) / (base1 + base2);
        } else if (base1 && height) {
            base2 = (2 * area) / height - base1;
        } else if (base2 && height) {
            base1 = (2 * area) / height - base2;
        }
    }

    document.getElementById('base1').value = base1 || '';
    document.getElementById('base2').value = base2 || '';
    document.getElementById('height').value = height || '';
    document.getElementById('area').value = area || '';

    drawTrapezoid(base1, base2, height);
}