# GTM Microsoft Clarity Utility Variable

This GTM custom variable allows you to dynamically retrieve Microsoft Clarity data for the current user session. Based on your selection, the variable returns one of the following:

- ✅ **Clarity Session Replay URL**
- ✅ **Clarity Session ID**
- ✅ **Clarity User ID**

> Developed by **Jude** for [DumbData](https://dumbdata.co/)

---

## 📦 What This Variable Does

Depending on your selected option in the template settings, the variable outputs one of:

| Option Selected        | Output Example |
|------------------------|----------------|
| **Session ID**         | `1eyx02x`      |
| **User ID**            | `2liupz`       |
| **Playback URL**       | `https://clarity.microsoft.com/player/***********/2liupz/1eyx02x` |

---

## 🛠️ How to Use This Template

### 1. Import the Template

1. Open Google Tag Manager.
2. Go to **Templates** → **Variable Templates**.
3. Click the **New** button and select **Import**.
4. Upload the `.tpl` file for this template.

### 2. Configure the Variable

Once imported:

- Choose the **Microsoft Clarity Variable** you want from the dropdown:
  - `Session Replay URL`
  - `Clarity Session ID`
  - `Clarity User ID`
- (Optional) Enter your **Microsoft Clarity Project ID** when using the Session Replay URL option.

### 3. Save & Use

- Save the variable and use it anywhere in GTM where you need to access Clarity data — for example in tags, triggers, or data layer pushes.

---

## 😀 About

This utility was built to streamline session-level Microsoft Clarity insights within GTM setups — whether for debugging, linking sessions, or analytics enrichment. It was developed as an enhancement to the [**Microsoft Clarity Playback URL**](https://github.com/Jude-Nwachukwu/microsoft-clarity-playback-url) GTM variable template.

Crafted with ❤️ by **Jude**  
🔗 Brought to you by [DumbData](https://dumbdata.co/)

---
## LICENSE

This repo is using Apache License 2.0
