function createTable() {
    var rows = parseInt(document.getElementById("rows").value);
    var columns = parseInt(document.getElementById("columns").value);
    var tableHTML = "<table>";

    var startRow, startColumn, endRow, endColumn;
    var border = Math.floor(Math.random() * 4);
    switch (border) {
        case 0:
            startRow = 0;
            startColumn = Math.floor(Math.random() * columns);
            endRow = rows - 1;
            endColumn = Math.floor(Math.random() * columns);
            break;
        case 1:
            startRow = Math.floor(Math.random() * rows);
            startColumn = columns - 1;
            endRow = Math.floor(Math.random() * rows);
            endColumn = 0;
            break;
        case 2:
            startRow = rows - 1;
            startColumn = Math.floor(Math.random() * columns);
            endRow = 0;
            endColumn = Math.floor(Math.random() * columns);
            break;
        case 3:
            startRow = Math.floor(Math.random() * rows);
            startColumn = 0;
            endRow = Math.floor(Math.random() * rows);
            endColumn = columns - 1;
            break;
    }

    for (var i = 0; i < rows; i++) {
        tableHTML += "<tr>";
        for (var j = 0; j < columns; j++) {
            var content = "";
            if (i === startRow && j === startColumn) {
                content = "<img src='img/geralt.png'>";
            } else if (i === endRow && j === endColumn) {
                content = "<img src='img/family.png'>";
            } else if (Math.random() < 0.3) {
                content = "<img src='img/block.jpg'>";
            }
            tableHTML += "<td contenteditable='true'>" + content + "</td>";
        }
        tableHTML += "</tr>";
    }
    tableHTML += "</table>";
    document.getElementById("mazeContainer").innerHTML = tableHTML;
    document.getElementById("pathLengthLabel").innerHTML = "Длина пути:";
}

function findPath() {
    var findSpeed = document.getElementById("speed").value;
    var delaySpeed = document.getElementById("delay").value;
    if (findSpeed != '' && delaySpeed != '') {
        var table = document.querySelectorAll("#mazeContainer table td");
        var startCell = null;
        var endCell = null;

        table.forEach(function(cell) {
            if (cell.querySelector("img[src='img/geralt.png']")) {
                startCell = cell;
            } else if (cell.querySelector("img[src='img/family.png']")) {
                endCell = cell;
            }
        });

        if (!startCell || !endCell) {
            alert("Необходимо указать начальную и конечную точки!");
            return;
        }

        var queue = [startCell];
        var visited = new Set();
        var parentMap = new Map();

        function processQueue() {
            if (queue.length === 0) {
                alert("Путь не найден!");
                return;
            }

            var currentCell = queue.shift();
            visited.add(currentCell);

            if (currentCell === endCell) {
                console.log(currentCell);
                reconstructPath(startCell, endCell, parentMap, delaySpeed);
                return;
            }

            var neighbors = getNeighbors(currentCell);
            neighbors.forEach(function(neighbor) {
                if (!visited.has(neighbor)) {
                    queue.push(neighbor);
                    visited.add(neighbor);
                    setTimeout(function() {
                        if (!neighbor.querySelector("img[src='img/geralt.png']"))
                            neighbor.classList.add("visited");
                    }, 200);
                    parentMap.set(neighbor, currentCell);
                }
            });

            setTimeout(processQueue, parseInt(findSpeed));
        }

        processQueue();
    }
}

function reconstructPath(startCell, endCell, parentMap, delay) {
    var currentCell = endCell;
    var pathCells = [];

    while (currentCell !== startCell) {
        pathCells.push(currentCell);
        currentCell = parentMap.get(currentCell);
    }
    pathCells.push(startCell);

    animatePath(pathCells, delay);

    var pathLength = pathCells.length - 1; 
    document.getElementById("pathLengthLabel").textContent = "Длина пути: " + pathLength;
}

function animatePath(pathCells, delay) {
    var index = 1;

    function highlightNext() {
        if (index < pathCells.length-1) {
            var cell = pathCells[index];
            cell.classList.remove("visited");
            cell.classList.add("path");
            index++;
            setTimeout(highlightNext, parseInt(delay));
        }
    }       

    highlightNext();
}

function getNeighbors(cell) {
    var table = cell.closest("table");
    var rowIndex = cell.parentNode.rowIndex;
    var cellIndex = cell.cellIndex;
    var neighbors = [];

    if (rowIndex > 0) {
        neighbors.push(table.rows[rowIndex - 1].cells[cellIndex]);
    }
    if (rowIndex < table.rows.length - 1) {
        neighbors.push(table.rows[rowIndex + 1].cells[cellIndex]);
    }
    if (cellIndex > 0) {
        neighbors.push(table.rows[rowIndex].cells[cellIndex - 1]);
    }
    if (cellIndex < table.rows[rowIndex].cells.length - 1) {
        neighbors.push(table.rows[rowIndex].cells[cellIndex + 1]);
    }

    return neighbors.filter(function(neighbor) {
        return !neighbor.querySelector("img[src='img/block.jpg']");
    });
}

function clearPath() {
    var cells = document.querySelectorAll("#mazeContainer table td");
    cells.forEach(function(cell) {
        cell.classList.remove("visited", "path");
    });
    document.getElementById("pathLengthLabel").textContent = "Длина пути:";
}
