#!/bin/bash

if [ -d /proc_host ]; then
  umount /proc
  mount -o bind /proc_host /proc
fi

sed -i "/graphite_host/c \ \ \ \ Host \"${graphite_host}\"" /etc/collectd.conf
sed -i "/graphite_prefix/c \ \ \ \ Prefix \"${graphite_prefix}.\"" /etc/collectd.conf
sed -i "/^Interval/c Interval "${collectd_interval}"" /etc/collectd.conf

# run collectd
/usr/sbin/collectd -f
