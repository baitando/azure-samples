package de.baitando.azure.samples.clearsbqueue;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Spring Boot application which takes care of removing all entries from a given Microsoft Azure Service Bus Queue.
 */
@SpringBootApplication
public class ClearServiceBusQueueApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClearServiceBusQueueApplication.class, args);
	}

}
