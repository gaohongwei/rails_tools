
ssh -f kwei@172.16.16.136 -L 6380:127.0.0.1:6379 -N

127.0.0.1:6380 <=> 172.16.16.136:6379

rails c
redis=Redis.new(port:6380)
redis.lrange("updater",0,-1)
This will display "updater" on 172.16.16.136 Redis
