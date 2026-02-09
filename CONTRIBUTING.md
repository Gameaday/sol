# Contributing to Sol

First off, thank you for considering contributing to Sol! It's people like you that make Sol such a great project.

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior by opening an issue.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When you are creating a bug report, please include as many details as possible:

* **Use a clear and descriptive title**
* **Describe the exact steps to reproduce the problem**
* **Provide specific examples to demonstrate the steps**
* **Describe the behavior you observed after following the steps**
* **Explain which behavior you expected to see instead and why**
* **Include screenshots or animated GIFs if possible**
* **Include your environment details** (OS, Flutter version, device, etc.)

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

* **Use a clear and descriptive title**
* **Provide a detailed description of the suggested enhancement**
* **Explain why this enhancement would be useful**
* **List some examples of how it would be used**
* **Specify if you're willing to implement it yourself**

### Pull Requests

The process described here has several goals:
- Maintain Sol's quality
- Fix problems that are important to users
- Enable a sustainable system for maintainers to review contributions

Please follow these steps:

1. **Fork the repository** and create your branch from `main`
2. **Follow the setup instructions** in [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md)
3. **Make your changes** following our coding standards
4. **Test your changes** thoroughly
5. **Update documentation** as needed
6. **Commit your changes** with clear commit messages
7. **Push to your fork** and submit a pull request

## Development Process

### Getting Started

1. Clone your fork of the repository:
```bash
git clone https://github.com/YOUR_USERNAME/sol.git
cd sol
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app to verify setup:
```bash
flutter run
```

### Project Structure

See [docs/design/ARCHITECTURE.md](docs/design/ARCHITECTURE.md) for detailed information about the project structure.

Key directories:
- `lib/models/` - Data models
- `lib/screens/` - UI screens
- `lib/services/` - Business logic services
- `lib/widgets/` - Reusable UI components
- `lib/game/` - Flame game components
- `lib/data/` - Game content data
- `test/` - Unit and widget tests
- `docs/` - Project documentation

### Coding Standards

#### Dart Style Guide

* Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
* Use `dart format` to format your code
* Use `flutter analyze` to check for issues
* Prefer single quotes for strings
* Use const constructors where possible

#### Code Organization

* One class per file (with few exceptions)
* Use meaningful file and class names
* Group related functionality together
* Keep files under 500 lines when possible

#### Documentation

* Add dartdoc comments for public APIs
* Update relevant documentation when changing behavior
* Include inline comments for complex logic
* Keep README.md up to date with new features

#### Testing

* Write unit tests for models and services
* Write widget tests for UI components
* Aim for meaningful test coverage, not just high percentages
* Tests should be clear and well-documented

### Commit Message Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

Types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that don't affect code meaning (formatting, etc.)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: Performance improvement
- `test`: Adding or updating tests
- `chore`: Changes to build process or auxiliary tools

Examples:
```
feat(battle): add critical hit mechanics
fix(save): prevent data loss when app is backgrounded
docs(readme): update installation instructions
refactor(player): simplify stat calculation logic
test(combat): add tests for damage calculation
```

### Branch Naming

Use descriptive branch names with the following patterns:
- `feature/description` - New features
- `fix/description` - Bug fixes
- `docs/description` - Documentation updates
- `refactor/description` - Code refactoring

## Types of Contributions

### Code Contributions

#### Areas to Contribute
- **Core Systems**: Battle mechanics, save system, inventory
- **UI/UX**: Screens, widgets, animations
- **Game Content**: Dialogue, quests, NPCs, monsters
- **Audio**: Music and sound effects integration
- **Performance**: Optimization and profiling

#### Before You Start
- Check existing issues and PRs to avoid duplication
- Comment on the issue to let others know you're working on it
- For large changes, create an issue first to discuss the approach

### Documentation Contributions

Good documentation is crucial! You can help by:
- Fixing typos and clarifying existing docs
- Adding examples and tutorials
- Documenting undocumented features
- Translating documentation
- Creating video tutorials or guides

### Design Contributions

We welcome design contributions:
- **Game Design**: Quest design, puzzle mechanics, combat balance
- **Art**: Sprites, tiles, UI elements (following retro aesthetic)
- **Audio**: Music tracks, sound effects
- **UX**: Improving user flows and interactions

### Content Contributions

Help create game content:
- **Story**: Dialogue, character backstories, world building
- **Quests**: Main quests, side quests, character quests
- **NPCs**: Character personalities and dialogue trees
- **Lore**: Expanding the world's history and mythology

## Review Process

### Pull Request Review

After submitting a PR:
1. Automated checks will run (linting, tests)
2. Maintainers will review your code
3. You may need to make changes based on feedback
4. Once approved, a maintainer will merge your PR

### What We Look For

- **Code Quality**: Clean, readable, maintainable code
- **Testing**: Adequate test coverage for changes
- **Documentation**: Updated docs and clear comments
- **Backwards Compatibility**: Doesn't break existing functionality
- **Performance**: No significant performance regressions
- **Style**: Follows project conventions

## Recognition

Contributors are recognized in several ways:
- Listed in GitHub's contributors page
- Mentioned in release notes for significant contributions
- Added to CONTRIBUTORS.md file (coming soon)

## Getting Help

Need help with something?
- Check [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) for development info
- Check [docs/design/ARCHITECTURE.md](docs/design/ARCHITECTURE.md) for system design
- Read [docs/QUICKSTART.md](docs/QUICKSTART.md) for quick reference
- Open a discussion on GitHub Discussions
- Comment on relevant issues

## Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flame Engine Documentation](https://docs.flame-engine.org/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Golden Sun Wiki](https://goldensun.fandom.com/) - For lore reference

## License

By contributing to Sol, you agree that your contributions will be licensed under the MIT License.

---

Thank you for your interest in contributing to Sol! We look forward to your contributions! 🌟
