#include "MyEngine/MyEngine.h"
#include <iostream>

namespace gr {

MyEngine::MyEngine() {
}

MyEngine::~MyEngine() {}

void MyEngine::run() {
    std::cout << "\n My Engine is Running in "; 
    #ifdef NDEBUG
        std::cout << ": RELEASE mode" << std::endl;
    #else
        std::cout << ": DEBUG mode" << std::endl;
    #endif
}

}  // namespace gr
