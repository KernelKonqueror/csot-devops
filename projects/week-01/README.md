# Week 01 — Mini-Project submission guide

**Project**: DevOps Toolkit Repo (Build 1 + Build 2 + polished shell utilities)
**Track**: 🟢 Part A — Local Track · **50 points** · manually graded
**Deadline**: **Sunday 11:59 PM (IST)** of Week 1
**Spec**: [content/week-01-linux-networking-git.md → Weekly Mini-Project](../../content/week-01-linux-networking-git.md#weekly-mini-project--devops-toolkit-repo)

> Two different things land in Week 1, **don't confuse them**:
>
> | | Contest (autograded) | Mini-Project (this guide) |
> |---|---|---|
> | **What** | 12 shell/sysadmin tasks | DevOps Toolkit GitHub repo |
> | **Points** | 100 | 50 |
> | **How submitted** | `csot` CLI → [csot-devops.devclub.in](https://csot-devops.devclub.in) | [contest portal → **Mini-project submission**](https://csot-devops.devclub.in/submission) (paste repo URL) |
> | **Grading** | Automatic, in a Docker sandbox | Manual review by mentors |
> | **Guide** | [`/submission/README.md`](../../submission/README.md) | You're reading it |

---

## 1. What you're submitting

A **public GitHub repository** containing your DevOps Toolkit (everything specified under **[Weekly Mini-Project — DevOps Toolkit Repo](../../content/week-01-linux-networking-git.md#weekly-mini-project--devops-toolkit-repo)** in the Week 1 content guide). At minimum:

- `README.md` — intro, usage, demo screenshots
- `DEMO.md` — sample outputs of every script
- `scripts/` — `backup.sh`, `log_parser.sh`, `user_manager.sh`, `sysreport.sh`, `deploy.sh`
- `systemd/` — Build 1's timer + Build 2's service unit files
- `nginx/` — Build 2's site config
- `.env.example`, `.gitignore`, `LICENSE`

Full required contents, examples, and the **grading rubric (50 pts)** live in the [Weekly Mini-Project section of the Week 1 guide](../../content/week-01-linux-networking-git.md#weekly-mini-project--devops-toolkit-repo). Read it before you start — this file is only about *how to hand it in*.

---

## 2. Submission checklist (do these before opening the form)

- [ ] Project repo is **public** on GitHub
- [ ] All 5 scripts run cleanly with sample input / `--help`
- [ ] Build 1's systemd timer is configured (proof: `systemctl list-timers` screenshot in `DEMO.md`)
- [ ] Build 2's nginx works on `localhost` with **either** self-signed HTTPS **or** Cloudflare Quick Tunnel
- [ ] Every script handles missing args, empty input, and file-not-found
- [ ] `.env.example` committed; `.env` **not** committed (check `.gitignore`)
- [ ] Commit history has **≥ 4 commits across 2+ branches with one merge**
- [ ] `trufflehog git file://. --only-verified` → **clean** (no verified secrets in history)
- [ ] `README.md` includes a 1-line "How to run" and a screenshot or asciicast
- [ ] You know the **exact commit SHA** you want graded (run `git rev-parse HEAD` in the project repo)

---

## 3. How to submit (on the contest portal)

Week 1 mini-projects are submitted **directly on the contest portal** — there is no separate form. You paste your public repo URL and the portal verifies it and records the commit.

> **Prerequisite:** you've already forked this repo per the root README's **[How to Participate](../../README.md#-how-to-participate-read-this-once-then-refer-back)** section. Your DevOps Toolkit lives in **its own separate public GitHub repo** — *not* inside this fork. (Putting it in a clean dedicated repo makes it a much better portfolio piece.)

### Step-by-step

```bash
# 1. Build your toolkit in its own dedicated PUBLIC repo, e.g.:
#    github.com/<your-github-username>/devops-toolkit-week01

# 2. Commit and PUSH your latest work to GitHub:
cd ~/path/to/devops-toolkit-week01
git add -A && git commit -m "week-01 submission" && git push
```

3. Go to the **contest portal** → **Mini-project submission**:
   **[csot-devops.devclub.in/submission](https://csot-devops.devclub.in/submission)** (sign in with your DevClub login, same as the contest).
4. Select **Week 1**, then fill the two fields and click **Submit**:

| Field | Example | Notes |
|---|---|---|
| **GitHub repository URL** | `https://github.com/janedoe/devops-toolkit-week01` | Must be **public**. The portal checks it's reachable. |
| **Assignment folder** | `.` | Use `.` if the project is at the repo root; otherwise the subfolder path. |

The portal automatically picks up your repo's **latest commit** on submit and shows it back to you (with a warning if you later push newer commits — just resubmit to update). A mentor reviews afterwards and your score appears on the leaderboard.

### Important rules

- You may **resubmit** any time before the deadline — the latest submission is the one graded. Push your fix, then hit **Update submission** on the portal so it captures the new commit.
- **Keep the repo public** between submission and grading — a private repo can't be reviewed and forfeits your points.
- **Don't force-push / rewrite history** after submitting — the recorded commit must still exist in your repo's history.

---

## 4. Late, partial, or "I'm stuck" submissions

- **Late**: Submit anyway — capped at 50% credit for the mini-project. Better than zero.
- **Partial**: Submit what works. Be honest in the *"Anything for the reviewer"* field of the form. Partial credit is real.
- **Stuck**: Ask in your cohort group `#help` channel describing what you tried. Mentors check daily.

---

## 5. Where things live (quick map)

```text
csot-devops/                                  ← upstream (this repo) — read-only for you
├── content/week-01-linux-networking-git.md   ← teaching material + project spec + rubric
├── submission/
│   ├── README.md                             ← CONTEST submission guide (csot CLI)
│   └── week-01/                              ← your contest task files (in YOUR fork)
└── projects/
    ├── README.md                             ← index of all weekly project guides
    └── week-01/
        └── README.md                         ← (you are here) mini-project submission guide

github.com/<you>/devops-toolkit-week01/       ← YOUR project repo (separate, public)
                                              ← URL goes into the portal's Mini-project submission page
```

---

## 6. FAQ

**Q. Where do I submit?**
On the contest portal: **[csot-devops.devclub.in/submission](https://csot-devops.devclub.in/submission)** → pick Week 1 → paste your public repo URL. Sign in with the same DevClub login you use for the contest. There is no separate Google form.

**Q. Can my project just live inside my fork of this repo (in `projects/week-01/`)?**
Technically yes, but it's a bad portfolio piece — your fork is full of cohort content (other guides, contest folders, etc.). Create a **dedicated public repo** for the project and submit *that* URL. Your fork is the workspace; the dedicated repo is the deliverable.

**Q. Can I submit the contest tasks on the same page?**
No. Contest tasks go through the `csot` CLI — see [`/submission/README.md`](../../submission/README.md). They are graded automatically and separately.

**Q. I don't have a domain — can I still do the HTTPS part?**
Yes. Use the **self-signed cert** flow or a **Cloudflare Quick Tunnel** (both shown in the [Week 1 guide](../../content/week-01-linux-networking-git.md#how-to-demo-https-without-a-real-domain)). Either is accepted for full marks.

**Q. Can I pick an Alternative Mini-Project instead?**
Yes — see [Alternative Mini-Project Ideas](../../content/week-01-linux-networking-git.md#alternative-mini-project-ideas-optional) in the Week 1 guide. Note which one you picked in the form's *"Project chosen"* field; the same 50-point rubric applies (with criteria mapped sensibly to your chosen project).

**Q. I submitted, then noticed a bug. Can I fix it?**
Yes — push the fix to your project repo, then hit **Update submission** on the [portal](https://csot-devops.devclub.in/submission) so it captures the new commit. The latest submission before the deadline is the one graded.
