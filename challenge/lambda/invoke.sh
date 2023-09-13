#!/bin/bash
aws lambda invoke     --function-name hello_world     --payload '{ "name": "Bob" }'     response.json