#include "MyEngine/MyEngine.h"
#include <iostream>

namespace gr {

MyEngine::MyEngine() {
}

MyEngine::~MyEngine() {}

void MyEngine::run() {
    std::cout << "\n Engine Running" << std::endl; 
}

}  // namespace gr
