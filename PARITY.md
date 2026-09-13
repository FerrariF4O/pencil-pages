# Goodnotes parity tracker

This tracker is for the current Release A prototype. “Untested” means code exists but still needs simulator or iPad validation. “Partial” means the feature is intentionally smaller than the Goodnotes workflow. “Blocked” means it is deferred or unavailable in this release.

| Capability | Status | Current state |
| --- | --- | --- |
| Native Apple Pencil ink | Untested | PencilKit editor and local persistence are implemented; test on the target iPad. |
| Pen, pencil, highlighter, eraser, lasso | Untested | Toolbar and width/colour controls exist; interaction needs device testing. |
| Pages and paper styles | Partial | Add pages and choose blank, ruled, grid, or dotted paper; reorder, rotate, and delete pages are deferred. |
| Notebook library | Partial | Create, search titles, favourite, trash, restore, and permanently delete; folders, covers, rename, and global content search are deferred. |
| Local save and recovery | Untested | Versioned JSON files, atomic writes, and background flush are implemented; interruption and low-storage tests remain. |
| Notebook export and backup | Partial | Share a single editable `.pencilpages` JSON document; batch backup/restore and Files import are deferred. |
| PDF import and annotation | Blocked | Planned for Release B. |
| Search handwritten ink and PDF text | Blocked | Planned for Release C and accuracy evaluation. |
| Audio synced to notes and flashcards | Blocked | Planned for Release C. |
| Handwriting correction, math help, summaries, AI questions | Blocked | Requires a separate on-device feasibility and quality study; this iPad does not support Apple Intelligence. |
| Whiteboards, rich text documents, collaboration, cloud sync | Blocked | Deferred; the app has no backend or account system. |
| Windows build and installation workflow | Untested | Public-repository GitHub Actions and unsigned IPA packaging are configured; a real Actions run and Sideloadly installation remain. |
