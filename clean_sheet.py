import gspread, json, time
from google.oauth2.credentials import Credentials

with open('G:/OpenClaw/workspace/google_token.json') as f:
    t = json.load(f)
creds = Credentials(token=t['token'], refresh_token=t['refresh_token'], token_uri=t['token_uri'], client_id=t['client_id'], client_secret=t['client_secret'])
gc = gspread.authorize(creds)
ws = gc.open_by_key('16s3hhVDwokKyR9AGVzRvmQ5czqvW8ORKCSmG45is87A').sheet1
rows = ws.get_all_values()

# Sites to DELETE (not directories, wrong niche, not relevant for a marketing agency)
DELETE_SITES = {
    'blurb.ca',              # Book printing, not a directory
    'zazzle.ca',             # Custom gifts retailer
    'relevantdirectory.ca',  # Home improvement only
    'cleaninginstitutedirectory.com',  # Cleaning niche only
    'kccontractors.com',     # Kansas home contractors only
    'homeservicezz.com',     # Site down
    'homerepairzz.com',      # Site down
    'homeizze.com',          # Site down
    'localroofingpros.org',  # US roofing only
    'roofersdb.com',         # Roofing only
    'homeprosdirect.com',    # Home services niche
    'weareopentoronto.ca',   # Paid only ($80/yr)
    'contractorsandsuppliers.com',  # Paid only ($59.99/mo)
    'houzz.com',             # Home design niche, complex signup
    'speakerdeck.com',       # Presentation sharing, not a directory
    'scribblemaps.com',      # Map tool, not a directory
    'zeemaps.com',           # Map tool, not a directory
    'lowcountryminoritybiz.com',  # US minority biz, not relevant
    'indianbusinesscanada.com',   # Indian business community
    'flipmyyard.com',       # Yard/landscaping niche
    'myperfecthost.com',     # Hosting niche
    'unitedcorpuschristi.org',  # Corpus Christi TX, not relevant
    'iglobal.co',            # Paid
    'resellerratings.com',   # Product reseller reviews
    'ca.yahoo.com',          # Not a directory listing service
    'softwareadvice.com',    # Enterprise software only
    'getapp.com',            # Enterprise software only
}

# Sites to mark as "Already done" (we already have these)
ALREADY_DONE = {
    'business.google.com',   # GBP already set up
    'linkedin.com/company',  # Already have company page
    'facebook.com/business', # Already have business page
}

# Find rows to delete (from bottom up to avoid index shifting)
rows_to_delete = []
rows_to_mark = []

for i, row in enumerate(rows):
    if len(row) < 2:
        continue
    site = row[1].strip().lower()
    status = row[3] if len(row) > 3 else ''
    
    if site in DELETE_SITES and not ('Active' in status or 'Submitted' in status):
        rows_to_delete.append(i + 1)  # 1-indexed
        print(f"DELETE row {i+1}: {row[1]}")
    elif site in ALREADY_DONE:
        rows_to_mark.append((i + 1, site))
        print(f"MARK DONE row {i+1}: {row[1]}")

print(f"\nTotal to delete: {len(rows_to_delete)}")
print(f"Total to mark done: {len(rows_to_mark)}")

# Delete from bottom up
if rows_to_delete:
    print("\nDeleting rows...")
    for row_num in sorted(rows_to_delete, reverse=True):
        try:
            ws.delete_rows(row_num)
            print(f"  Deleted row {row_num}")
            time.sleep(1.5)  # Rate limit
        except Exception as e:
            print(f"  Error deleting row {row_num}: {e}")
            time.sleep(5)

# Mark already-done sites
time.sleep(2)
ws2 = gc.open_by_key('16s3hhVDwokKyR9AGVzRvmQ5czqvW8ORKCSmG45is87A').sheet1
rows2 = ws2.get_all_values()
for i, row in enumerate(rows2):
    if len(row) < 2:
        continue
    site = row[1].strip().lower()
    status = row[3] if len(row) > 3 else ''
    if site in ALREADY_DONE and not status:
        try:
            ws2.update_cell(i + 1, 4, 'Already set up')
            print(f"  Marked row {i+1}: {row[1]} as already done")
            time.sleep(1.5)
        except Exception as e:
            print(f"  Error: {e}")
            time.sleep(5)

print("\nDone! Sheet cleaned.")
