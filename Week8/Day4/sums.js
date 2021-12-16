const readline = require("readline");
reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft === 0) {
        completionCallback(sum)
        reader.close()
    }
    
    if (numsLeft > 0) {
        reader.question("What number would you like to add?", response => {
            int_response = parseInt(response);
            
            sum += int_response;
            
            addNumbers(sum, numsLeft - 1, completionCallback)
            // console.log(sum);
            
        });
        
    }
    
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));