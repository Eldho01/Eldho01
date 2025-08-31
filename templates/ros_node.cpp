/*
 * This template is for ROS2 (Humble)
 * Add necessary code for full utilization
 *
 */

#include "rclcpp/rclcpp.hpp"

class Node_name: public rclcpp::Node
{
public:
    Node_name() : Node("Node_name")
    {
        RCLCPP_INFO(this->get_logger(), "Hello in CPP");
        //other initializations
    }
private:
    //callback and other defenitions
};




int main(int argc, char **argv)
{
    rclcpp::init(argc, argv);

    auto node = std::make_shared<Node_name>();
    
    rclcpp::spin(node);

    rclcpp::shutdown();
    return 0;

}
