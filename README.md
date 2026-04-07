# Flutter Base Structureo

Basic Flutter starter project with common utilities (theme, buttons, dialogs, constants) to speed up development.

## How to Use

### 1. Clone the template

Clone the repository and rename the project folder.

```bash
git clone https://github.com/YashKody/base_structure.git new_app_name
```

```bash
# For SSH
git clone git@github.com:YashKody/base_structure.git new_app_name
cd new_app_name
```

---

### 2. Install dependencies

```bash
flutter pub get
```

---

### 3. Rename the project (recommended)

Activate the rename tool (only needed once on your machine):

```bash
dart pub global activate change_project_name
```

Rename the project name and all imports:

```bash
dart pub global run change_project_name --interactive
```

> This updates `pubspec.yaml`, all `package:` imports in Dart files, and the app display name.

Rename the package/bundle ID (Android & iOS):

```bash
dart run change_app_package_name:main com.yourcompany.newapp
```

---

### 4. Clean and rebuild

```bash
flutter clean
flutter pub get
```

---

### 5. Verify setup

Run the project once to make sure everything works.

```bash
flutter run
```

---

---

### 6. Clean git history

Before committing clear the git history and re-init the repo with remote repo

```bash
rm -rf .git
```

---