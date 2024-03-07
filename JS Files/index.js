// This HTTP GET Request used to get all Processors within our DB to
// populated the Processor dropdown box
$.ajax({
url: "http://localhost:3000/api/getProcessors",
method: "GET",
success: function (processors) {
    processors.forEach(function (processor) {
    $("#processors").append(
        `<option id = "${processor.ProductID}" value="${processor.UnitPrice}">${processor.ProductName} || Price: ${processor.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Graphics Cards within our DB to
// populated the Graphics Card dropdown box
$.ajax({
url: "http://localhost:3000/api/getGPUs",
method: "GET",
success: function (gpus) {
    gpus.forEach(function (gpus) {
    $("#gpus").append(
        `<option id = "${gpus.ProductID}" value="${gpus.UnitPrice}">${gpus.ProductName} || Price: ${gpus.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Memory within our DB to
// populated the Memory dropdown box
$.ajax({
url: "http://localhost:3000/api/getMemory",
method: "GET",
success: function (memory) {
    memory.forEach(function (memory) {
    $("#memory").append(
        `<option id = "${memory.ProductID}" value="${memory.UnitPrice}">${memory.ProductName} || Price: ${memory.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Storage within our DB to
// populated the Storage dropdown box
$.ajax({
url: "http://localhost:3000/api/getStorage",
method: "GET",
success: function (storage) {
    storage.forEach(function (storage) {
    $("#storage").append(
        `<option id = "${storage.ProductID}" value="${storage.UnitPrice}">${storage.ProductName} || Price: ${storage.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Motherboards within our DB to
// populated the Motherboard dropdown box
$.ajax({
url: "http://localhost:3000/api/getMOBOs",
method: "GET",
success: function (mobos) {
    mobos.forEach(function (mobos) {
    $("#mobos").append(
        `<option id = "${mobos.ProductID}" value="${mobos.UnitPrice}">${mobos.ProductName} || Price: ${mobos.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Power Supplies within our DB to
// populated the Power Supply dropdown box
$.ajax({
url: "http://localhost:3000/api/getPSUs",
method: "GET",
success: function (psus) {
    psus.forEach(function (psus) {
    $("#psus").append(
        `<option id = "${psus.ProductID}" value="${psus.UnitPrice}">${psus.ProductName} || Price: ${psus.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Cases within our DB to
// populated the Case dropdown box
$.ajax({
url: "http://localhost:3000/api/getCases",
method: "GET",
success: function (cases) {
    cases.forEach(function (cases) {
    $("#cases").append(
        `<option id = "${cases.ProductID}" value="${cases.UnitPrice}">${cases.ProductName} || Price: ${cases.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Cooling within our DB to
// populated the Cooling dropdown box
$.ajax({
url: "http://localhost:3000/api/getCooling",
method: "GET",
success: function (cooling) {
    cooling.forEach(function (cooling) {
    $("#cooling").append(
        `<option id = "${cooling.ProductID}" value="${cooling.UnitPrice}">${cooling.ProductName} || Price: ${cooling.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

// This HTTP GET Request used to get all Peripherals within our DB to
// populated the Peripherals dropdown box
$.ajax({
url: "http://localhost:3000/api/getPeripherals",
method: "GET",
success: function (peripherals) {
    peripherals.forEach(function (peripherals) {
    $("#peripherals").append(
        `<option id = "${peripherals.ProductID}" value="${peripherals.UnitPrice}">${peripherals.ProductName} || Price: ${peripherals.UnitPrice}</option>`
    );
    });
},
error: function (xhr, status, error) {
    console.error("Error fetching processors:", error);
},
});

function openCart() {
window.location.href = "cart.html";
}

function addToCart() {
// Gets the selected option element for each product
const selectedProcessorOption =
    document.getElementById("processors").options[
    document.getElementById("processors").selectedIndex
    ];
const selectedGPUOption =
    document.getElementById("gpus").options[
    document.getElementById("gpus").selectedIndex
    ];
const selectedMemoryOption =
    document.getElementById("memory").options[
    document.getElementById("memory").selectedIndex
    ];
const selectedStorageOption =
    document.getElementById("storage").options[
    document.getElementById("storage").selectedIndex
    ];
const selectedMoboOption =
    document.getElementById("mobos").options[
    document.getElementById("mobos").selectedIndex
    ];
const selectedPsuOption =
    document.getElementById("psus").options[
    document.getElementById("psus").selectedIndex
    ];
const selectedCaseOption =
    document.getElementById("cases").options[
    document.getElementById("cases").selectedIndex
    ];
const selectedCoolingOption =
    document.getElementById("cooling").options[
    document.getElementById("cooling").selectedIndex
    ];
const selectedPeripheralOption =
    document.getElementById("peripherals").options[
    document.getElementById("peripherals").selectedIndex
    ];

// Gets all products speicified unit price value
const selectedProcessor = document.getElementById("processors").value;
const selectedGPU = document.getElementById("gpus").value;
const selectedMemory = document.getElementById("memory").value;
const selectedStorage = document.getElementById("storage").value;
const selectedMobo = document.getElementById("mobos").value;
const selectedPsu = document.getElementById("psus").value;
const selectedCase = document.getElementById("cases").value;
const selectedCooling = document.getElementById("cooling").value;
const selectedPeripheral = document.getElementById("peripherals").value;

// Gets all products specified names
const selectedProcessorName = selectedProcessorOption.text;
const selectedGPUName = selectedGPUOption.text;
const selectedMemoryName = selectedMemoryOption.text;
const selectedStorageName = selectedStorageOption.text;
const selectedMoboName = selectedMoboOption.text;
const selectedPsuName = selectedPsuOption.text;
const selectedCaseName = selectedCaseOption.text;
const selectedCoolingName = selectedCoolingOption.text;
const selectedPeripheralName = selectedPeripheralOption.text;

// Gets all products specified IDs
const selectedProcessorID = selectedProcessorOption.id;
const selectedGPUID = selectedGPUOption.id;
const selectedMemoryID = selectedMemoryOption.id;
const selectedStorageID = selectedStorageOption.id;
const selectedMoboID = selectedMoboOption.id;
const selectedPsuID = selectedPsuOption.id;
const selectedCaseID = selectedCaseOption.id;
const selectedCoolingID = selectedCoolingOption.id;
const selectedPeripheralID = selectedPeripheralOption.id;

// Construct an array of selected items
const selectedItems = [
    {
    name: selectedProcessorName,
    id: selectedProcessor,
    index: selectedProcessorID,
    },
    {
    name: selectedGPUName,
    id: selectedGPU,
    index: selectedGPUID,
    },
    {
    name: selectedMemoryName,
    id: selectedMemory,
    index: selectedMemoryID,
    },
    {
    name: selectedStorageName,
    id: selectedStorage,
    index: selectedStorageID,
    },
    {
    name: selectedMoboName,
    id: selectedMobo,
    index: selectedMoboID,
    },
    {
    name: selectedPsuName,
    id: selectedPsu,
    index: selectedPsuID,
    },
    {
    name: selectedCaseName,
    id: selectedCase,
    index: selectedCaseID,
    },
    {
    name: selectedCoolingName,
    id: selectedCooling,
    index: selectedCoolingID,
    },
    {
    name: selectedPeripheralName,
    id: selectedPeripheral,
    index: selectedPeripheralID,
    },
];

// Store all the selected items in localStorage to aid in transfer to cart.html
localStorage.setItem("cartItems", JSON.stringify(selectedItems));

alert("Items added to the cart successfully!");
}