from i3pystatus import Status
import os

# Determine device
hostname = "rathong"
mobile = True
lanInterface = "eno1"

hostname = os.uname()[1]
if hostname.startswith("ewpc5"):
   mobile = False
   lanInterface = "eno1"
if hostname == "sagarmatha":
   mobile = False
   lanInterface = "enp3s0"

status = Status()

status.register("clock", format="%a %-d %b %X")

status.register("shell",
   command = "xkblayout-state print %s",
   interval = 5,
   on_leftclick = "xkblayout-state set +1",
   on_rightclick = "run",
)

if mobile:
   status.register("battery",
      format="{status} {percentage:.2f}% - {remaining:%E%h:%M}",
      alert=True,
      alert_percentage=5,
      color="#ffff00",
      full_color="#009900",
      critical_color="#ff0000",
      status={
         "DIS":  "BAT",
         "CHR":  "CHR",
         "FULL": "FUL",
      }
   )

status.register("load",
   format="CPU: {avg1} {avg5} {avg15}",
   color='#839395'
)

status.register("mem",
   format="RAM: {percent_used_mem}%/{total_mem}GiB",
   divisor=1e9,
   color='#839395',
   warn_color='#ca4a15',
   alert_color='#dc312e'
)

status.register("network",
   interface=lanInterface,
   format_up="{interface}: {v4cidr} {network_graph_recv}",
   format_down="{interface}: DOWN",
   graph_width=20,
   start_color='#859900',
   end_color='#dc312e'
)

status.register("pulseaudio", format="♪ {volume}%")

status.run()
