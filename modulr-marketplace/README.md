# MODULR plugin marketplace

Plugins for marketers and operators who want to sound like themselves at scale.

## Install in Cowork

1. Open Cowork.
2. Add this marketplace:
   - **Marketplace URL:** `https://github.com/modulr/modulr-marketplace`
3. Browse and install any plugin in the catalog.

When new plugins are published or existing ones are updated, they propagate to your install automatically (if you have auto-sync enabled).

## What's in the marketplace

| Plugin             | What it does                                                                                  |
| ------------------ | --------------------------------------------------------------------------------------------- |
| `modulr-voice-os`  | Email drafting OS that sounds like you, not AI. Wizard setup, anti-AI gate, citation discipline. |

More on the way.

## How to use a plugin

After install, type the plugin's command in any Cowork chat. For example:

```
/setup-voice-os
```

That kicks off the onboarding wizard for `modulr-voice-os`.

## Repo structure

```
modulr-marketplace/
├── .claude-plugin/
│   └── marketplace.json    # catalog manifest
├── plugins/
│   └── modulr-voice-os/    # plugin source
└── LICENSE                 # MIT
```

## License

[MIT](./LICENSE). Use it, fork it, modify it, ship it. Attribution appreciated, not required.

## About MODULR

We help operators and marketers ship email that sounds like them. The plugins here are the tools we use, packaged so anyone can install them.

- Website: https://www.gomodulr.com
- Email: hello@gomodulr.com
- Email-voice workshop: https://www.gomodulr.com/email-voice-workshop
