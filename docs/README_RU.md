# CodeDash

Дашборд + CLI для сессий Claude Code, Codex и OpenCode. Смотри, ищи, возобновляй, конвертируй и передавай сессии между AI-агентами.

[English](../README.md) | [Chinese / 中文](README_ZH.md)

## Быстрый старт

```bash
npm i -g codedash-app
codedash run
```

## Поддерживаемые агенты

| Агент | Сессии | Превью | Поиск | Конвертация | Handoff |
|-------|--------|--------|-------|-------------|---------|
| Claude Code | JSONL | Да | Да | Да | Да |
| Codex CLI | JSONL | Да | Да | Да | Да |
| OpenCode | SQLite | Да | Да | - | Да |

## Возможности

**Браузерный дашборд**
- Grid/List вид с группировкой по проектам
- Trigram нечёткий поиск + полнотекстовый поиск по всем сообщениям
- Фильтры по инструменту, тегам, диапазону дат
- Звёздочки, теги (bug, feature, research, infra, deploy, review)
- Heatmap активности, Session Replay с ползунком
- Темы: Dark, Light, System

**Мониторинг**
- Запущенные сессии: CPU, Memory, PID, Uptime
- LIVE/WAITING бейджи с анимированной рамкой
- Focus Terminal — переключение на активную сессию

**Аналитика стоимости**
- Реальная стоимость из usage данных (input/output/cache)
- Цены по моделям: Opus, Sonnet, Haiku, Codex, GPT-5
- Графики по дням и проектам

**Cross-Agent**
- Конвертация сессий между Claude Code и Codex
- Handoff: контекстный документ для продолжения в другом агенте

**CLI**
```bash
codedash run                          # запуск дашборда
codedash search <запрос>              # поиск по всем сессиям
codedash show <session-id>            # детали сессии
codedash handoff <id> [target]        # передача контекста
codedash convert <id> claude|codex    # конвертация формата
codedash export / import              # бэкап и восстановление
codedash update / restart / stop      # управление
```

## Требования

- Node.js >= 18
- Хотя бы один AI-агент установлен
- macOS / Linux / Windows

## Лицензия

MIT
