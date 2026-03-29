import gspread
from google.oauth2.credentials import Credentials
import json, time

with open('G:/OpenClaw/workspace/google_token.json') as f:
    t = json.load(f)

creds = Credentials(
    token=t['token'],
    refresh_token=t['refresh_token'],
    token_uri=t['token_uri'],
    client_id=t['client_id'],
    client_secret=t['client_secret'],
)

gc = gspread.authorize(creds)
sheet = gc.open_by_key('16s3hhVDwokKyR9AGVzRvmQ5czqvW8ORKCSmG45is87A')
ws = sheet.sheet1

existing = ws.get_all_values()
print(f"Current rows: {len(existing)}")

existing_sites = set()
for row in existing:
    if len(row) > 1:
        existing_sites.add(row[1].lower().strip())

# Remaining sites that weren't added yet
remaining = [
    ['profilecanada.com', 'Canadian business profiles'],
    ['bcbusiness.ca', 'BC business directory'],
    ['vernonbc.com', 'Vernon local directory'],
    ['crunchbase.com', 'Company profile - high DA'],
    ['medium.com', 'Publish articles with backlink'],
    ['about.me', 'Professional profile page'],
    ['linkedin.com/company', 'Company page with website link'],
    ['facebook.com/business', 'Business page with website link'],
    ['bbb.org', 'Better Business Bureau'],
    ['mapquest.com', 'MapQuest business listing'],
    ['foursquare.com', 'Foursquare business listing'],
    ['nextdoor.com', 'Local community business page'],
]

# Filter out already added
to_add = [[s, n] for s, n in remaining if s.lower() not in existing_sites]
print(f"Sites to add: {len(to_add)}")

if to_add:
    # Batch append
    last_row = len(existing)
    rows_to_append = []
    for i, (site, note) in enumerate(to_add):
        num = last_row + i + 1
        rows_to_append.append([str(num), site, '', '', '', note])
    
    ws.append_rows(rows_to_append, value_input_option='RAW')
    print(f"Appended {len(rows_to_append)} rows")
    for site, note in to_add:
        print(f"  Added: {site}")

print("Done!")
