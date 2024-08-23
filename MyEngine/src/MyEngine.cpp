#include "MyEngine/MyEngine.h"
#include <iostream>

namespace gr {

MyEngine::MyEngine() {
}

MyEngine::~MyEngine() {}

void MyEngine::run() {
    std::cout << "\n My Engine is Running in "; 
    #ifdef _DEBUG
        std::cout << ": DEBUG mode" << std::endl;
    #elif defined(NDEBUG)
        std::cout << ": RELEASE mode" << std::endl;
    #else
        std::cout << ": an unknown mode" << std::endl;
    #endif
}

}  // namespace gr
