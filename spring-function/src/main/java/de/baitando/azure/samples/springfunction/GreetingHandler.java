package de.baitando.azure.samples.springfunction;

import com.microsoft.azure.functions.ExecutionContext;
import com.microsoft.azure.functions.HttpMethod;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.annotation.AuthorizationLevel;
import com.microsoft.azure.functions.annotation.FunctionName;
import com.microsoft.azure.functions.annotation.HttpTrigger;
import org.springframework.cloud.function.adapter.azure.FunctionInvoker;

import java.util.Optional;

public class GreetingHandler extends FunctionInvoker<String, String> {

    @FunctionName("greetings")
    public String execute(
            @HttpTrigger(
                    name = "req",
                    methods = {HttpMethod.GET},
                    authLevel = AuthorizationLevel.ANONYMOUS
            ) HttpRequestMessage<Optional<String>> request,
            ExecutionContext context) {
        context.getLogger().info("Processing a greeting request.");
        final String name = request.getQueryParameters().get("name");

        return handleRequest(name, context);
    }
}
