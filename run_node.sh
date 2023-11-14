#!/bin/sh

echo "I am a nwaku node"

MY_EXT_IP=$(wget -qO- https://api4.ipify.org)

if [ -n "${NODEKEY}" ]; then
    ## By enforcing a env var NODEKEY, the node will always have the same peer id.
    NODEKEY=--nodekey=${NODEKEY}
fi

## The bootstrap nodes used belong to wakuv2.prod fleet (https://fleets.status.im/)

exec /usr/bin/wakunode\
  --relay=true\
  --pubsub-topic=/waku/2/hack-factory\
  --filter=true\
  --lightpush=true\
  --rpc-admin=true\
  --keep-alive=true\
  --max-connections=150\
  --cluster-id=1\
  --discv5-bootstrap-node="enr:-P-4QJI8tS1WTdIQxq_yIrD05oIIW1Xg-tm_qfP0CHfJGnp9dfr6ttQJmHwTNxGEl4Le8Q7YHcmi-kXTtphxFysS11oBgmlkgnY0gmlwhLymh5GKbXVsdGlhZGRyc7hgAC02KG5vZGUtMDEuZG8tYW1zMy53YWt1djIucHJvZC5zdGF0dXNpbS5uZXQGdl8ALzYobm9kZS0wMS5kby1hbXMzLndha3V2Mi5wcm9kLnN0YXR1c2ltLm5ldAYfQN4DiXNlY3AyNTZrMaEDbl1X_zJIw3EAJGtmHMVn4Z2xhpSoUaP5ElsHKCv7hlWDdGNwgnZfg3VkcIIjKIV3YWt1Mg8"\
  --discv5-bootstrap-node="enr:-QERuEC0EGWTjg_gYdnuPypJ9LAbB3lml6M8GiRajGegL2iWEj1MJzUMV9X6jXw7mMAQQLozLCTLFT-zv-ELQLPwWdACAYJpZIJ2NIJpcIQieWRsim11bHRpYWRkcnO4cgA2NjFub2RlLTAxLmdjLXVzLWNlbnRyYWwxLWEud2FrdXYyLnByb2Quc3RhdHVzaW0ubmV0BnZfADg2MW5vZGUtMDEuZ2MtdXMtY2VudHJhbDEtYS53YWt1djIucHJvZC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhA_30kHgQqfXZRioa4J_u5asgXTJ5iw_8w3lEICH4TFu_g3RjcIJ2X4N1ZHCCIyiFd2FrdTIP"\
  --discv5-bootstrap-node="enr:-QERuEDABor1lVmSa5ek8of5eBc8jZoxxdleJVLLdMl8UeZHNwhsVp64SFiCT4BRIIfcs7uxTPUCjmWxK_OA1s-FfIW7AYJpZIJ2NIJpcIQI0t7nim11bHRpYWRkcnO4cgA2NjFub2RlLTAxLmFjLWNuLWhvbmdrb25nLWMud2FrdXYyLnByb2Quc3RhdHVzaW0ubmV0BnZfADg2MW5vZGUtMDEuYWMtY24taG9uZ2tvbmctYy53YWt1djIucHJvZC5zdGF0dXNpbS5uZXQGH0DeA4lzZWNwMjU2azGhAo0C-VvfgHiXrxZi3umDiooXMGY9FvYj5_d1Q4EeS7eyg3RjcIJ2X4N1ZHCCIyiFd2FrdTIP"\
  --discv5-discovery=true\
  --discv5-udp-port=9005\
  --discv5-enr-auto-update=True\
  --log-level=DEBUG\
  --rpc-port=8545\
  --rpc-address=0.0.0.0\
  --tcp-port=30304\
  --metrics-server=True\
  --metrics-server-port=8003\
  --metrics-server-address=0.0.0.0\
  --rest=true\
  --rest-address=0.0.0.0\
  --rest-port=8645\
  --nat=extip:"${MY_EXT_IP}"\
  ${NODEKEY}\
  ${EXTRA_ARGS}

