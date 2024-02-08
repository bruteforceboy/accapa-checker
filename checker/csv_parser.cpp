#include <iostream>
#include <fstream>
#include <algorithm>

int main() {
    freopen("input.txt", "r", stdin); // .csv in .txt format 
    std::string s;
    while (std::getline(std::cin, s)) {
        int pos = s.find(',');
        std::string folder = s.substr(0, pos);
        std::string error = s.substr(pos + 1);

        if (error.find(',') != std::string::npos) {
            // modify to allow alternative error types
            error = error.substr(0, error.find(','));
        }
        
        // modify path 
        folder = "tests/output/" + folder;

        std::ofstream outputFile(folder);
        
        if (!outputFile.is_open()) {
            std::cerr << "Error opening output file: " << folder << std::endl;
            return 1;
        }
        
        outputFile << error << std::endl;
        outputFile.close();
    }
    return 0;
}
