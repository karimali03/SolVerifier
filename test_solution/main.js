// Using Node.js for input
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('', (number) => {
    console.log(1);
    rl.close();
});
