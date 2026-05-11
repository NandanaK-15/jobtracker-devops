#!/bin/bash
aws ecr get-login-password --region ap-south-1 \
  | docker login --username AWS --password-stdin \
  904053120070.dkr.ecr.ap-south-1.amazonaws.com

docker pull 904053120070.dkr.ecr.ap-south-1.amazonaws.com/todoapp:latest

docker run -d \
  --name todoapp \
  -p 80:5000 \
  -e MONGO_URI="mongodb+srv://todouser:todo1234@cluster0.upuujdv.mongodb.net/tododb?retryWrites=true&w=majority" \
  904053120070.dkr.ecr.ap-south-1.amazonaws.com/todoapp:latest