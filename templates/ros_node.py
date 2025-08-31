#! /usr/bin/env python3
import rclpy
from rclpy.node import Node

class FirstNode(Node):
    def __init__(self):

        super().__init__("first") # initialize the node with the name "first"
        self.get_logger().info("Hello, ROS2!") # log a message to the console

def main(args=None):
    rclpy.init(args=args) # initialize the ROS2 communication
    node = FirstNode() # create an instance of the FirstNode class
    rclpy.spin(node)
    rclpy.shutdown() # shutdown the ROS2 communication


if __name__ == '__main__':
    main()
