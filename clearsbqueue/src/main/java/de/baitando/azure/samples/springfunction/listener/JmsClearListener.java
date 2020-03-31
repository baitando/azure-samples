package de.baitando.azure.samples.springfunction.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

/**
 * Listener which retrieves messages from the given Microsoft Azure Service Bus Queue. There is no real processing
 * of the data. There is simply a log message written to the console whenever a messages was processed.
 */
@Component
public class JmsClearListener {

    private final Logger logger = LoggerFactory.getLogger(JmsClearListener.class);

    private int counter = 0;

    @JmsListener(destination = "${baitando.sample.servicebus-queue.name}", containerFactory = "jmsListenerContainerFactory")
    public void receiveMessage() {
        logger.info("Processed message {}", ++counter);
    }
}