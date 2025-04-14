const fs = require("fs");
const path = require("path");

function listFiles(dirPath) {
  fs.readdirSync(dirPath).forEach((file) => {
    let fullPath = path.join(dirPath, file);
    if (fs.lstatSync(fullPath).isDirectory()) {
      listFiles(fullPath);
    } else {
      console.log(`- "${fullPath}"`);
    }
  });
}

// Replace 'your_directory_path' with the path to your directory
listFiles("gen/headers/TrustWalletCore");
