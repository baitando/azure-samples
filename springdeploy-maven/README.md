# Clear Service Bus Queue

This sample clears all messages contained in a Service Bus Queue.
It connects to the Service Bus Namespace and reads all messages from the specified Service Bus Queue.
The messages are not processed.
Instead only a message is printed to the console indicating the current progress.

To run it please follow the steps listed below.

1. Clone the repository.
2. Copy `application.properties.template` to `application.properties` and enter the desired values.
3. Run `ClearServiceBusQueueApplication`.