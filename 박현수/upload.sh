# 사용법: ./copy_and_push.zsh <new-filename>

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <new-filename>"
  exit 1
fi

NEW_NAME=$1
SRC="../../SwiftPractice/SwiftPractice/main.swift"
DEST="./${NEW_NAME}"

# 1) 원본 파일이 있는지 확인
if [[ ! -f "$SRC" ]]; then
  echo "Error: source file not found: $SRC"
  exit 1
fi

# 2) 복사
echo "==> Copying $SRC → $DEST"
cp "$SRC" "$DEST" || { echo "Error: cp failed"; exit 1; }

# 3) Git 리포지토리 루트 찾기
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [[ -z "$REPO_ROOT" ]]; then
  echo "Error: current directory is not inside a git repo"
  exit 1
fi
cd "$REPO_ROOT"

# 4) git pull
echo "==> git pull"
git pull || { echo "Error: git pull failed"; exit 1; }

# 5) git add
echo "==> git add"
git add . || { echo "Error: git add failed"; exit 1; }

# 6) git commit
echo "==> git commit -m \"$NEW_NAME\""
git commit -m "$NEW_NAME" || { echo "Error: git commit failed"; exit 1; }

# 7) git push
echo "==> git push"
git push || { echo "Error: git push failed"; exit 1; }

echo "✅ Done."
