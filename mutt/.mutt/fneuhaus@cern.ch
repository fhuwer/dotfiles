set spoolfile = "+fneuhaus@cern.ch/INBOX"
set record = "+fneuhaus@cern.ch/Sent"
set postponed = "+fneuhaus@cern.ch/Drafts"

set realname  = "Friedemann Neuhaus"
set from      = fneuhaus@cern.ch
set signature = "~/.mutt/fneuhaus@cern.ch.signature"

set imap_user = fneuhaus
set imap_pass = `pass mail/fneuhaus@cern.ch`
set smtp_url = smtp://$imap_user:$imap_pass@smtp.cern.ch:587
set ssl_starttls = yes
