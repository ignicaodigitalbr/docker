# Ignição Digital Docker Images

Images created by Ignição digital team to help development and test process.

## ruby-dynamodb-redis image

To use redis and dynamodb resources from this image you'll need to run some services manually:

starting redis service:
`service redis-server start`

starting dynamodb:
`/usr/bin/java -Djava.library.path=/var/dynamodb_wd/ -jar /var/dynamodb_wd/DynamoDBLocal.jar -dbPath /var/dynamodb_local -port 8000 -sharedDb &`
