function generateMagicSquare(size, index) {
    document.getElementById('magicSquareContainer').innerHTML = '';

    var magicSquare;
    if (size % 2 === 0) {
        magicSquare = createMagicSquareWithCondition(size);
    } else {
        magicSquare = createMagicSquare(size);
    }

    var magicSquareHTML = '<table>'; 
    for (var i = 0; i < size; i++) {
        magicSquareHTML += '<tr>';
        for (var j = 0; j < size; j++) {
            magicSquareHTML += '<td style="opacity: 0;">' + magicSquare[i][j] + '</td>'; 
        }
        magicSquareHTML += '<td class="rightSumCell"></td>';
        magicSquareHTML += '</tr>';
    }
    magicSquareHTML += '<tr>'; 
    for (var k = 0; k < size + 1; k++) {
        magicSquareHTML += '<td class="bottomSumCell"></td>';
    }
    magicSquareHTML += '</tr>';
    magicSquareHTML += '</table>';

    document.getElementById('magicSquareContainer').innerHTML = magicSquareHTML;

    animateMagicSquare(size); 

    var buttons = document.querySelectorAll('.btn');
    buttons.forEach(function(btn) {
        btn.classList.remove('selected');
    });
    buttons[index].classList.add('selected');

    calculateSums(magicSquare);
}

function animateMagicSquare(size) {
    var rows = document.querySelectorAll('#magicSquareContainer tr');
    var delay = 200; 
    var index = 0;

    function showNextRow() {
        if (index < rows.length) {
            var cells = rows[index].querySelectorAll('td'); 
            for (var i = 0; i < cells.length; i++) {
                cells[i].style.opacity = '1'; 
            }
            index++;
            setTimeout(showNextRow, delay);
        }
    }

    showNextRow();
}

function sumRightCells(matrix, row, col) {
    var sum = 0;
    for (var i = 0; i < col; i++) {
        sum += matrix[row][i];
    }
    return sum;
}

function sumBottomCells(matrix, row, col) {
    var sum = 0;
    for (var i = 0; i < row; i++) {
        sum += matrix[i][col];
    }
    return sum;
}

function calculateSums(matrix) {
    var size = matrix.length;
    var rightSums = [];
    var bottomSums = [];
    var diagonalSum = 0;
    for (var i = 0; i < size; i++) {
        var rightSum = sumRightCells(matrix, i, size);
        var bottomSum = sumBottomCells(matrix, size, i);
        diagonalSum += matrix[i][i];
        rightSums.push(rightSum);
        bottomSums.push(bottomSum);
    }

    var rightSumCells = document.querySelectorAll('.rightSumCell');
    for (var j = 0; j < size; j++) {
        rightSumCells[j].innerHTML = rightSums[j];
    }

    var bottomSumCells = document.querySelectorAll('.bottomSumCell');
    for (var k = 0; k < size; k++) {
        bottomSumCells[k].innerHTML = bottomSums[k];
    }

    bottomSumCells[size].innerHTML = diagonalSum;
}

function createMagicSquare(N) {
    var magicSquare = new Array(N);
    var footer = document.querySelector('.footer-content');
    var amount = document.querySelector('.amount');
    var rowSum = (N * (N * N + 1)) / 2;

    for (var i = 0; i < N; i++) {
        magicSquare[i] = new Array(N).fill(0);
    }

    var num = 1;
    var row = 0;
    var col = Math.floor(N / 2);

    while (num <= N * N) {
        magicSquare[row][col] = num;
        num++;

        var nextRow = (row - 1 + N) % N;
        var nextCol = (col + 1) % N;

        if (magicSquare[nextRow][nextCol] !== 0) {
            row = (row + 1) % N;
        } else {
            row = nextRow;
            col = nextCol;
        }
    }

    var str = '';
    footer.innerHTML = '';
    for (var i = 0; i < N; i++) {
        for (var j = 0; j < N; j++) {
            str += String(magicSquare[i][j]) + ' ';
        }
    }

    footer.innerHTML = str.trim();
    amount.innerHTML = rowSum;

    return magicSquare;
}

function createEvenOrderMagicSquare(size) {
    var magicSquare = new Array(size);
    var str = '';
    var footer = document.querySelector('.footer-content');
    var amount = document.querySelector('.amount');
    var rowSum = size * (size * size + 1) / 2;

    for (var i = 0; i < size; i++) {
        magicSquare[i] = new Array(size).fill(0);
    }

    var num = 1;
    for (var i = 0; i < size; i++) {
        for (var j = 0; j < size; j++) {
            if ((i % 4 == j % 4) || ((i % 4 + j % 4) == 3)) {
                magicSquare[i][j] = num;
            } else {
                magicSquare[i][j] = size * size + 1 - num;
            }
            str += String(magicSquare[i][j]) + ' ';
            num++;
        }
    }

    footer.innerHTML = str.trim();
    amount.innerHTML = rowSum;

    return magicSquare;
}

function createCustomEvenOrderMagicSquare(size) {
    var footer = document.querySelector('.footer-content');
    var amount = document.querySelector('.amount');
    var rowSum = size * (size * size + 1) / 2;
    var magicSquare;

    if (size === 6) {
        magicSquare = [
            [13, 22, 18, 27, 11, 20],
            [31, 4, 36, 9, 29, 2],
            [12, 21, 14, 23, 16, 25],
            [30, 3, 5, 32, 34, 7],
            [17, 26, 10, 19, 15, 24],
            [8, 35, 28, 1, 6, 33]
        ];
    } else if (size === 10) {
        magicSquare = [
            [92, 99, 1, 8, 15, 67, 74, 51, 58, 40],
            [98, 80, 7, 14, 16, 73, 55, 57, 64, 41],
            [79, 6, 88, 20, 22, 54, 56, 63, 70, 47],
            [85, 87, 19, 21, 3, 60, 62, 69, 71, 28],
            [86, 93, 25, 2, 9, 61, 68, 75, 52, 34],
            [17, 24, 76, 83, 90, 42, 49, 26, 33, 65],
            [23, 5, 82, 89, 91, 48, 30, 32, 39, 66],
            [4, 81, 13, 95, 97, 29, 31, 38, 45, 72],
            [10, 12, 94, 96, 78, 35, 37, 44, 46, 53],
            [11, 18, 100, 77, 84, 36, 43, 50, 27, 59]
        ];
    }
    var str = magicSquare.map(row => row.join(' ')).join('\n');

    footer.textContent = str;
    amount.textContent = rowSum;

    return magicSquare;
}

function createMagicSquareWithCondition(N) {
    if (N % 2 === 1) {
        return createMagicSquare(N);
    } else {
        if (N % 4 === 0) {
            return createEvenOrderMagicSquare(N);
        } else {
            return createCustomEvenOrderMagicSquare(N);
        }
    }
}