#!/usr/bin/env bash
# デスクトップのこのファイルから、プロジェクトへ飛んで app.py を実行します
set -euo pipefail
PROJECT="/Users/ta_rabo/project"
if [[ ! -f "$PROJECT/app.py" ]]; then
  echo "見つかりません: $PROJECT/app.py"
  echo "フォルダが移動している場合は、このスクリプト内の PROJECT= を書き換えてください。"
  exit 1
fi
cd "$PROJECT"
chmod +x run.sh 2>/dev/null || true
# 引数が無いときは HTML レポートも出力（ブラウザで開きやすくする）
if [[ $# -eq 0 ]]; then
  ./run.sh --html-report
else
  ./run.sh "$@"
fi
REPORT="${PROJECT}/data/report.html"
if [[ -f "$REPORT" ]]; then
  open "$REPORT" 2>/dev/null || xdg-open "$REPORT" 2>/dev/null || true
fi
