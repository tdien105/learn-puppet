node "ec2amaz-bdbt3aa.ap-southeast-1.compute.internal" {
  include mssql
}

node "default" {
  notify { 'Hi puppet': }
}