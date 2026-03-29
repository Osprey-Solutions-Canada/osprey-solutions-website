import gspread
from google.oauth2.credentials import Credentials
import json
from datetime import datetime

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

# Read existing data
existing = ws.get_all_values()
print(f"Found {len(existing)} rows")

# Add header columns C, D, E, F if not present
header_row = existing[0] if existing else []
if len(header_row) < 3:
    ws.update_cell(1, 3, 'Citation URL')
    ws.update_cell(1, 4, 'Status')
    ws.update_cell(1, 5, 'Login Email')
    ws.update_cell(1, 6, 'Notes')
    print("Added header columns C-F")

# Additional sites to add that aren't in the list
additional_sites = [
    # Marketing/Agency directories (high relevance for Osprey)
    ['', 'clutch.co', '', '', '', 'Top agency directory - high authority'],
    ['', 'designrush.com', '', '', '', 'Agency marketplace - good for leads too'],
    ['', 'upcity.com', '', '', '', 'B2B marketplace for agencies'],
    ['', 'sortlist.com', '', '', '', 'Agency directory - EU + NA'],
    ['', 'goodfirms.co', '', '', '', 'Software & agency reviews'],
    ['', 'agencyspotter.com', '', '', '', 'Marketing agency directory'],
    ['', 'digitalagencynetwork.com', '', '', '', 'Digital marketing directory'],
    # Tech/SaaS directories (for RoofQuote)
    ['', 'capterra.com', '', '', '', 'SaaS directory - list RoofQuote'],
    ['', 'g2.com', '', '', '', 'Software reviews - list RoofQuote'],
    ['', 'getapp.com', '', '', '', 'SaaS directory - list RoofQuote'],
    ['', 'softwareadvice.com', '', '', '', 'SaaS directory - list RoofQuote'],
    ['', 'producthunt.com', '', '', '', 'Launch RoofQuote here'],
    ['', 'saashub.com', '', '', '', 'SaaS alternative directory'],
    ['', 'alternativeto.net', '', '', '', 'Alternative software directory'],
    # Canadian directories
    ['', 'ca.yahoo.com', '', '', '', 'Yahoo Canada business listing'],
    ['', 'canadabiz.net', '', '', '', 'Canadian business directory'],
    ['', 'yellowpages.ca', '', '', '', 'Yellow Pages Canada'],
    ['', 'canpages.ca', '', '', '', 'Canadian Pages directory'],
    ['', 'ourbis.ca', '', '', '', 'Canadian business listings'],
    ['', 'profilecanada.com', '', '', '', 'Canadian business profiles'],
    # BC specific
    ['', 'bcbusiness.ca', '', '', '', 'BC business directory'],
    ['', 'vernonbc.com', '', '', '', 'Vernon local directory'],
    # High authority general
    ['', 'crunchbase.com', '', '', '', 'Company profile - high DA'],
    ['', 'medium.com', '', '', '', 'Publish articles with backlink'],
    ['', 'about.me', '', '', '', 'Professional profile page'],
    ['', 'linkedin.com/company', '', '', '', 'Company page with website link'],
    ['', 'facebook.com/business', '', '', '', 'Business page with website link'],
    ['', 'bbb.org', '', '', '', 'Better Business Bureau'],
    ['', 'mapquest.com', '', '', '', 'MapQuest business listing'],
    ['', 'foursquare.com', '', '', '', 'Foursquare business listing'],
    ['', 'nextdoor.com', '', '', '', 'Local community business page'],
]

# Find last row number
last_row = len(existing)

# Check which sites already exist
existing_sites = set()
for row in existing:
    if len(row) > 1:
        existing_sites.add(row[1].lower().strip())

# Add new sites
added = 0
section_header_added = False
for site in additional_sites:
    if site[1].lower() not in existing_sites:
        if not section_header_added:
            last_row += 1
            ws.update_cell(last_row, 1, 'Additional Sites (Nigel)')
            section_header_added = True
        last_row += 1
        num = last_row - 1
        ws.update_cell(last_row, 1, str(num))
        ws.update_cell(last_row, 2, site[1])
        ws.update_cell(last_row, 6, site[5])
        added += 1
        print(f"  Added: {site[1]}")

print(f"\nAdded {added} new sites to the sheet")
print(f"Total rows now: {last_row}")
