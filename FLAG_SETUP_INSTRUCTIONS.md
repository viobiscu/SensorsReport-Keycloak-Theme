# Missing Flag Images - Setup Instructions

## Required Flag Images

You need to replace the placeholder files with actual flag images for:

### 🇭🇺 Hungarian (hu.png)
- **Language Code:** `hu`
- **File:** `/login/resources/img/flags/hu.png`
- **Recommended Size:** 20px height, maintain aspect ratio

### 🇮🇹 Italian (it.png)
- **Language Code:** `it`  
- **File:** `/login/resources/img/flags/it.png`
- **Recommended Size:** 20px height, maintain aspect ratio

### 🇵🇱 Polish (pl.png)
- **Language Code:** `pl`
- **File:** `/login/resources/img/flags/pl.png`
- **Recommended Size:** 20px height, maintain aspect ratio

### 🇹🇷 Turkish (tr.png)
- **Language Code:** `tr`
- **File:** `/login/resources/img/flags/tr.png`
- **Recommended Size:** 20px height, maintain aspect ratio

## Where to Get Flag Images

### Option 1: Free Flag Icons
- **Flaticon:** https://www.flaticon.com/search?word=flag
- **Iconfinder:** https://www.iconfinder.com/search/?q=flag
- **Icons8:** https://icons8.com/icons/set/flag

### Option 2: Country Flag Emoji to PNG
- **EmojiOne:** https://emojione.com/
- **Twemoji:** https://twemoji.twitter.com/

### Option 3: Flag Icons from Government Sources
- Look for official flag resources from respective countries

## Technical Requirements

1. **Format:** PNG with transparency
2. **Size:** Approximately 20px height (width can vary by country)
3. **Quality:** High resolution for crisp display
4. **Naming:** Exact names: `hu.png`, `it.png`, `pl.png`, `tr.png`

## Installation Steps

1. Download the 4 flag images
2. Replace the placeholder files in `/login/resources/img/flags/`
3. Ensure file names match exactly: `hu.png`, `it.png`, `pl.png`, `tr.png`
4. Test the language selector to verify flags display correctly

## Verification

After adding the flags:
1. Access the login page
2. Open the language selector
3. Check that all flags display correctly
4. Test switching languages to ensure functionality

## Current Status

✅ **CSS Classes Added:** All flag CSS classes are configured
✅ **Message Files Created:** Full translations for all languages
✅ **JavaScript Support:** Dynamic flag loading implemented
⚠️ **Flag Images:** Placeholder files need to be replaced with actual images

Once you replace the placeholder flag files with actual images, your theme will have complete multi-language support with proper flag representations.
