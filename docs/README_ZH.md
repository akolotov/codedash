# CodeDash

Claude Code、Codex 和 OpenCode 会话的仪表板 + CLI。查看、搜索、恢复、转换和在 AI 编程代理之间传递会话。

[English](../README.md) | [Russian / Русский](README_RU.md)

## 快速开始

```bash
npm i -g codedash-app
codedash run
```

## 支持的代理

| 代理 | 会话 | 预览 | 搜索 | 转换 | 交接 |
|------|------|------|------|------|------|
| Claude Code | JSONL | 是 | 是 | 是 | 是 |
| Codex CLI | JSONL | 是 | 是 | 是 | 是 |
| OpenCode | SQLite | 是 | 是 | - | 是 |

## 功能

**浏览器仪表板**
- 网格/列表视图，按项目分组
- Trigram 模糊搜索 + 全文深度搜索
- 按工具、标签、日期范围过滤
- 星标、标签、活动热力图、会话回放
- 主题：Dark、Light、System

**实时监控**
- 运行中的会话：CPU、内存、PID、运行时间
- LIVE/WAITING 徽章，带动画边框

**成本分析**
- 基于实际 token 使用量的真实成本
- 按模型定价、按日/项目图表

**跨代理**
- Claude Code 和 Codex 之间的会话转换
- Handoff：生成上下文文档以在任何代理中继续

**CLI**
```bash
codedash run / search / show / handoff / convert / export / import / update
```

## 要求

- Node.js >= 18
- 至少安装一个 AI 编程代理
- macOS / Linux / Windows

## 许可证

MIT
