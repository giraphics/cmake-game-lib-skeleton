#pragma once

namespace gr {
class MyEngine {
 public:
   MyEngine();
  ~MyEngine();

  MyEngine(const MyEngine&) = delete;
  MyEngine&operator=(const MyEngine&) = delete;

  void run();

 private:
};
}  // namespace gr
