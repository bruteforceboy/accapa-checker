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
        folder = "~/Desktop/inno/accapa/c.ogbonna/checker/tests/output/" + folder;

        freopen(folder.c_str(), "w", stdout);
        std::cout << error << std::endl;
    }
    return 0;
}
