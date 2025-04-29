const canvas = document.getElementById('shapeCanvas');
const ctx = canvas.getContext('2d');

// Функции для отрисовки фигур
function drawSquare(side) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    const x = (canvas.width - side) / 2;
    const y = (canvas.height - side) / 2;
    ctx.fillRect(x, y, side, side);
    ctx.strokeRect(x, y, side, side);
}

function drawRectangle(length, width) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    const x = (canvas.width - length) / 2;
    const y = (canvas.height - width) / 2;
    ctx.fillRect(x, y, length, width);
    ctx.strokeRect(x, y, length, width);
}

function drawCircle(radius) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    ctx.arc(canvas.width / 2, canvas.height / 2, radius, 0, 2 * Math.PI);
    ctx.fill();
    ctx.stroke();
}

function drawTriangle(base, height) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const x = (canvas.width - base) / 2;
    const y = (canvas.height + height) / 2;
    ctx.moveTo(x, y);
    ctx.lineTo(x + base, y);
    ctx.lineTo(x + base / 2, y - height);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

function drawRhombus(side, height) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const x = canvas.width / 2;
    const y = canvas.height / 2;
    ctx.moveTo(x, y - height / 2);
    ctx.lineTo(x + side / 2, y);
    ctx.lineTo(x, y + height / 2);
    ctx.lineTo(x - side / 2, y);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

function drawParallelogram(base, height) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const x = (canvas.width - base) / 2;
    const y = (canvas.height - height) / 2;
    ctx.moveTo(x, y);
    ctx.lineTo(x + base, y);
    ctx.lineTo(x + base - 20, y + height);
    ctx.lineTo(x - 20, y + height);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

function drawRightTriangle(base, height) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const x = (canvas.width - base) / 2;
    const y = (canvas.height + height) / 2;
    ctx.moveTo(x, y);
    ctx.lineTo(x + base, y);
    ctx.lineTo(x, y - height);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

function drawIsoscelesTriangle(base, height) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const x = (canvas.width - base) / 2;
    const y = (canvas.height + height) / 2;
    ctx.moveTo(x, y);
    ctx.lineTo(x + base, y);
    ctx.lineTo(x + base / 2, y - height);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

function drawEquilateralTriangle(side) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const height = (Math.sqrt(3) / 2) * side;
    const x = (canvas.width - side) / 2;
    const y = (canvas.height + height) / 2;
    ctx.moveTo(x, y);
    ctx.lineTo(x + side, y);
    ctx.lineTo(x + side / 2, y - height);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

function drawScaleneTriangle(side1, side2, side3) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const x = canvas.width / 2;
    const y = canvas.height / 2;
    ctx.moveTo(x, y);
    ctx.lineTo(x + side1, y);
    ctx.lineTo(x + side2, y - side3);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

function drawEllipse(majorAxis, minorAxis) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    ctx.ellipse(canvas.width / 2, canvas.height / 2, majorAxis / 2, minorAxis / 2, 0, 0, 2 * Math.PI);
    ctx.fill();
    ctx.stroke();
}

function drawTrapezoid(base1, base2, height) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.strokeStyle = 'black';
    ctx.fillStyle = 'white';
    ctx.beginPath();
    const x1 = (canvas.width - base1) / 2;
    const x2 = (canvas.width - base2) / 2;
    const y = (canvas.height - height) / 2;
    ctx.moveTo(x1, y);
    ctx.lineTo(x1 + base1, y);
    ctx.lineTo(x2 + base2, y + height);
    ctx.lineTo(x2, y + height);
    ctx.closePath();
    ctx.fill();
    ctx.stroke();
}

// Функции для подсветки
function highlightSquare(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawSquare(parseFloat(document.getElementById('side').value || 0));
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const side = parseFloat(document.getElementById('side').value || 0);
    const x = (canvas.width - side) / 2;
    const y = (canvas.height - side) / 2;

    if (property === 'side') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + side, y);
        ctx.stroke();
    } else if (property === 'perimeter') {
        ctx.strokeRect(x, y, side, side);
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.fillRect(x, y, side, side);
    }
}

function highlightRectangle(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const length = parseFloat(document.getElementById('length').value || 0);
    const width = parseFloat(document.getElementById('width').value || 0);
    drawRectangle(length, width);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x = (canvas.width - length) / 2;
    const y = (canvas.height - width) / 2;

    if (property === 'length') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + length, y);
        ctx.stroke();
    } else if (property === 'width') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x, y + width);
        ctx.stroke();
    } else if (property === 'perimeter') {
        ctx.strokeRect(x, y, length, width);
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.fillRect(x, y, length, width);
    }
}

function highlightCircle(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const radius = parseFloat(document.getElementById('radius').value || 0);
    drawCircle(radius);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    if (property === 'radius') {
        ctx.beginPath();
        ctx.arc(canvas.width / 2, canvas.height / 2, radius, 0, 2 * Math.PI);
        ctx.stroke();
    } else if (property === 'circumference') {
        ctx.beginPath();
        ctx.arc(canvas.width / 2, canvas.height / 2, radius, 0, 2 * Math.PI);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.arc(canvas.width / 2, canvas.height / 2, radius, 0, 2 * Math.PI);
        ctx.fill();
    }
}

function highlightTriangle(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const base = parseFloat(document.getElementById('base').value || 0);
    const height = parseFloat(document.getElementById('height').value || 0);
    drawTriangle(base, height);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x = (canvas.width - base) / 2;
    const y = (canvas.height + height) / 2;

    if (property === 'base') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.stroke();
    } else if (property === 'height') {
        ctx.beginPath();
        ctx.moveTo(x + base / 2, y);
        ctx.lineTo(x + base / 2, y - height);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.lineTo(x + base / 2, y - height);
        ctx.closePath();
        ctx.fill();
    }
}

function highlightRhombus(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const side = parseFloat(document.getElementById('side').value || 0);
    const height = parseFloat(document.getElementById('height').value || 0);
    drawRhombus(side, height);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x = canvas.width / 2;
    const y = canvas.height / 2;

    if (property === 'side') {
        ctx.beginPath();
        ctx.moveTo(x, y - height / 2);
        ctx.lineTo(x + side / 2, y);
        ctx.stroke();
    } else if (property === 'height') {
        ctx.beginPath();
        ctx.moveTo(x, y - height / 2);
        ctx.lineTo(x, y + height / 2);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x, y - height / 2);
        ctx.lineTo(x + side / 2, y);
        ctx.lineTo(x, y + height / 2);
        ctx.lineTo(x - side / 2, y);
        ctx.closePath();
        ctx.fill();
    }
}

function highlightParallelogram(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const base = parseFloat(document.getElementById('base').value || 0);
    const height = parseFloat(document.getElementById('height').value || 0);
    drawParallelogram(base, height);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x = (canvas.width - base) / 2;
    const y = (canvas.height - height) / 2;

    if (property === 'base') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.stroke();
    } else if (property === 'height') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x - 20, y + height);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.lineTo(x + base - 20, y + height);
        ctx.lineTo(x - 20, y + height);
        ctx.closePath();
        ctx.fill();
    }
}

function highlightRightTriangle(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const base = parseFloat(document.getElementById('base').value || 0);
    const height = parseFloat(document.getElementById('height').value || 0);
    drawRightTriangle(base, height);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x = (canvas.width - base) / 2;
    const y = (canvas.height + height) / 2;

    if (property === 'base') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.stroke();
    } else if (property === 'height') {
        ctx.beginPath();
        ctx.moveTo(x + base, y);
        ctx.lineTo(x, y - height);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.lineTo(x, y - height);
        ctx.closePath();
        ctx.fill();
    }
}

function highlightIsoscelesTriangle(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const base = parseFloat(document.getElementById('base').value || 0);
    const height = parseFloat(document.getElementById('height').value || 0);
    drawIsoscelesTriangle(base, height);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x = (canvas.width - base) / 2;
    const y = (canvas.height + height) / 2;

    if (property === 'base') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.stroke();
    } else if (property === 'height') {
        ctx.beginPath();
        ctx.moveTo(x + base / 2, y);
        ctx.lineTo(x + base / 2, y - height);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + base, y);
        ctx.lineTo(x + base / 2, y - height);
        ctx.closePath();
        ctx.fill();
    }
}

function highlightEquilateralTriangle(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const side = parseFloat(document.getElementById('side').value || 0);
    drawEquilateralTriangle(side);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const height = (Math.sqrt(3) / 2) * side;
    const x = (canvas.width - side) / 2;
    const y = (canvas.height + height) / 2;

    if (property === 'side') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + side, y);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + side, y);
        ctx.lineTo(x + side / 2, y - height);
        ctx.closePath();
        ctx.fill();
    }
}

function highlightScaleneTriangle(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const side1 = parseFloat(document.getElementById('side1').value || 0);
    const side2 = parseFloat(document.getElementById('side2').value || 0);
    const side3 = parseFloat(document.getElementById('side3').value || 0);
    drawScaleneTriangle(side1, side2, side3);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x = canvas.width / 2;
    const y = canvas.height / 2;

    if (property === 'side1') {
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + side1, y);
        ctx.stroke();
    } else if (property === 'side2') {
        ctx.beginPath();
        ctx.moveTo(x + side1, y);
        ctx.lineTo(x + side2, y - side3);
        ctx.stroke();
    } else if (property === 'side3') {
        ctx.beginPath();
        ctx.moveTo(x + side2, y - side3);
        ctx.lineTo(x, y);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x + side1, y);
        ctx.lineTo(x + side2, y - side3);
        ctx.closePath();
        ctx.fill();
    }
}

function highlightEllipse(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const majorAxis = parseFloat(document.getElementById('majorAxis').value || 0);
    const minorAxis = parseFloat(document.getElementById('minorAxis').value || 0);
    drawEllipse(majorAxis, minorAxis);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    if (property === 'majorAxis') {
        ctx.beginPath();
        ctx.ellipse(canvas.width / 2, canvas.height / 2, majorAxis / 2, minorAxis / 2, 0, 0, 2 * Math.PI);
        ctx.stroke();
    } else if (property === 'minorAxis') {
        ctx.beginPath();
        ctx.ellipse(canvas.width / 2, canvas.height / 2, majorAxis / 2, minorAxis / 2, 0, 0, 2 * Math.PI);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.ellipse(canvas.width / 2, canvas.height / 2, majorAxis / 2, minorAxis / 2, 0, 0, 2 * Math.PI);
        ctx.fill();
    }
}

function highlightTrapezoid(property) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    const base1 = parseFloat(document.getElementById('base1').value || 0);
    const base2 = parseFloat(document.getElementById('base2').value || 0);
    const height = parseFloat(document.getElementById('height').value || 0);
    drawTrapezoid(base1, base2, height);
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 3;

    const x1 = (canvas.width - base1) / 2;
    const x2 = (canvas.width - base2) / 2;
    const y = (canvas.height - height) / 2;

    if (property === 'base1') {
        ctx.beginPath();
        ctx.moveTo(x1, y);
        ctx.lineTo(x1 + base1, y);
        ctx.stroke();
    } else if (property === 'base2') {
        ctx.beginPath();
        ctx.moveTo(x2, y + height);
        ctx.lineTo(x2 + base2, y + height);
        ctx.stroke();
    } else if (property === 'height') {
        ctx.beginPath();
        ctx.moveTo(x1, y);
        ctx.lineTo(x2, y + height);
        ctx.stroke();
    } else if (property === 'area') {
        ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';
        ctx.beginPath();
        ctx.moveTo(x1, y);
        ctx.lineTo(x1 + base1, y);
        ctx.lineTo(x2 + base2, y + height);
        ctx.lineTo(x2, y + height);
        ctx.closePath();
        ctx.fill();
    }
}

function clearHighlight() {
    const shape = document.getElementById('shapeSelector').value;
    switch (shape) {
        case 'square':
            drawSquare(parseFloat(document.getElementById('side').value || 0));
            break;
        case 'rectangle':
            drawRectangle(
                parseFloat(document.getElementById('length').value || 0),
                parseFloat(document.getElementById('width').value || 0)
            );
            break;
        case 'circle':
            drawCircle(parseFloat(document.getElementById('radius').value || 0));
            break;
        case 'triangle':
            drawTriangle(
                parseFloat(document.getElementById('base').value || 0),
                parseFloat(document.getElementById('height').value || 0)
            );
            break;
        case 'rhombus':
            drawRhombus(
                parseFloat(document.getElementById('side').value || 0),
                parseFloat(document.getElementById('height').value || 0)
            );
            break;
        case 'parallelogram':
            drawParallelogram(
                parseFloat(document.getElementById('base').value || 0),
                parseFloat(document.getElementById('height').value || 0)
            );
            break;
        case 'rightTriangle':
            drawRightTriangle(
                parseFloat(document.getElementById('base').value || 0),
                parseFloat(document.getElementById('height').value || 0)
            );
            break;
        case 'isoscelesTriangle':
            drawIsoscelesTriangle(
                parseFloat(document.getElementById('base').value || 0),
                parseFloat(document.getElementById('height').value || 0)
            );
            break;
        case 'equilateralTriangle':
            drawEquilateralTriangle(parseFloat(document.getElementById('side').value || 0));
            break;
        case 'scaleneTriangle':
            drawScaleneTriangle(
                parseFloat(document.getElementById('side1').value || 0),
                parseFloat(document.getElementById('side2').value || 0),
                parseFloat(document.getElementById('side3').value || 0)
            );
            break;
        case 'ellipse':
            drawEllipse(
                parseFloat(document.getElementById('majorAxis').value || 0),
                parseFloat(document.getElementById('minorAxis').value || 0)
            );
            break;
        case 'trapezoid':
            drawTrapezoid(
                parseFloat(document.getElementById('base1').value || 0),
                parseFloat(document.getElementById('base2').value || 0),
                parseFloat(document.getElementById('height').value || 0)
            );
            break;
    }
}