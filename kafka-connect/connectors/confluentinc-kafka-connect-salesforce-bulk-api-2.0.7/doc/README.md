# Kafka Salesforce Connectors

A multi Maven Module [Kafka Connector](http://kafka.apache.org/documentation.html#connect) project that targets specifically Salesforce services.

# Development

To build a development version you'll need a recent version of Kafka. You can build
*kafka-connect-salesforce-parent* with Maven using the standard lifecycle phases.

# Modules

* [kafka-connect-salesforce-common](kafka-connect-salesforce-common): The module has abstract connectors, tasks and utilities.
* [kafka-connect-salesforce-cdc](kafka-connect-salesforce-cdc): The module has CDC source connector.
* [kafka-connect-salesforce-platform-event](kafka-connect-salesforce-platform-event): The module has platform event source/sink connector.
* [kafka-connect-salesforce-push-topic](kafka-connect-salesforce-push-topic): The module has push topic source connector.
* [kafka-connect-salesforce-sobject](kafka-connect-salesforce-sobject): The module has SObject sink connector.
* [kafka-connect-salesforce](kafka-connect-salesforce): The module has multiple connectors (CDC, PushTopic, PlatformEvent, SObject). This module is used for releasing the plugins.
* [kafka-connect-salesforce-bulk-api](kafka-connect-salesforce-bulk-api): The module has bulk api source connector.

# Documentation

Documentation on the connector is hosted on Confluent's
[docs site](https://docs.confluent.io/current/connect/kafka-connect-salesforce/).

Source code is located in Confluent's
[docs repo](https://github.com/confluentinc/docs/tree/master/connect/kafka-connect-salesforce). If changes
are made to configuration options for the connector, be sure to generate the RST docs (as described
below) and open a PR against the docs repo to publish those changes!

#Wiki

Wiki for the Salesforce Connector can be found [here](https://github.com/confluentinc/kafka-connect-salesforce/wiki).
Go through it to setup the Salesforce account and connector properties.

# Contribute

- Source Code: https://github.com/confluentinc/kafka-connect-salesforce
- Issue Tracker: https://github.com/confluentinc/kafka-connect-salesforce/issues

# Running Integration Tests

1. In order to run integration tests, create [Salesforce Developer Account](https://developer.salesforce.com/signup).

2. Reset your security token by going to settings -> [Reset Security Token](https://1.bp.blogspot.com/-aN2m-YGMiQ8/U2WWr7MTC_I/AAAAAAAAFzQ/ngd3Fjjn0Yw/s1600/ResetSecurityToken.png). The new security token will be sent to you via email.

3. Get your consumer key and consumer secret -> [Get key and secret](https://developer.salesforce.com/forums/?id=9060G000000I8HJQA0)

4. Create a file under the following path `{project-root}/credentials/salesforce.credentials.properties` with the following properties : 

```
salesforce.username=user1@confluent.com
salesforce.password=****
salesforce.password.token=****
```
 
5. Run the integration tests: `mvn clean integration-test`
