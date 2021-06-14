# Cron expression syntax
## Time component ranges
- Minute: [0, 59]
- Hour: [0, 23]
- Day of the month: [1, 31]
- Month: [1, 12]
- Day of the week [0, 6]
  - 0 corresponds to Sunday
# Examples
- `0,30 * * * *` run at minute 0 and minute 30 (i.e. every 30 minutes), every hour, every day of the month, every month, every day of the week
- `*/30 * * * *` run at every minute that is divisible by 30, every hour, every day of the month, every month, every day of the week
  - E.g. 0/30 != 1, so it won't run at the start of every hour
  - E.g. 30/30 == 1, so it will run every hour at the 30 minute mark (e.g. 1:30 pm, 2:30 pm, etc.)
  - E.g. 60/30 is not valid because the minute range is [0,59]