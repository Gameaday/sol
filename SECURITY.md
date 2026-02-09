# Security Policy

## Supported Versions

We take security seriously and strive to keep Sol safe for all users. Currently, only the latest development version is supported with security updates.

| Version | Supported          |
| ------- | ------------------ |
| main    | :white_check_mark: |
| < 0.3.0 | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability in Sol, please follow these steps:

### 1. Do Not Open a Public Issue

Please **do not** open a public GitHub issue for security vulnerabilities. This helps protect users until a fix can be released.

### 2. Report Privately

Report security vulnerabilities by:
- Opening a private security advisory through GitHub's security tab
- Or emailing the maintainers directly (if email is available)
- Or creating a private discussion in GitHub Discussions marked as security-related

### 3. Include Details

When reporting a vulnerability, please include:
- **Description**: Clear description of the vulnerability
- **Impact**: What could an attacker do with this vulnerability?
- **Steps to Reproduce**: Detailed steps to reproduce the issue
- **Affected Versions**: Which versions are affected?
- **Suggested Fix**: If you have ideas on how to fix it (optional)
- **Your Environment**: OS, Flutter version, device type, etc.

### 4. Response Timeline

- **Initial Response**: We aim to respond within 48 hours
- **Status Updates**: We'll provide updates every 5-7 days
- **Resolution**: We aim to resolve critical issues within 30 days

## Security Update Process

When a security vulnerability is confirmed:

1. **Acknowledgment**: We'll acknowledge receipt of your report
2. **Investigation**: We'll investigate and confirm the vulnerability
3. **Fix Development**: We'll develop and test a fix
4. **Release**: We'll release a security update
5. **Disclosure**: We'll publicly disclose the vulnerability after the fix is released

## Security Best Practices

When using or contributing to Sol:

### For Users
- Always use the latest stable version
- Keep your Flutter SDK and dependencies up to date
- Review app permissions before installing
- Report suspicious behavior

### For Contributors
- Never commit sensitive data (API keys, passwords, tokens)
- Use environment variables for configuration
- Follow secure coding practices
- Review dependencies for known vulnerabilities
- Run `flutter analyze` before submitting PRs

## Known Security Considerations

### In-App Purchases
- IAP implementations use official platform APIs
- No payment data is stored locally
- Transactions are handled by platform stores (Google Play, App Store)

### Save Data
- Save files are stored locally on the device
- No cloud synchronization of save data currently
- Save data is not encrypted (contains no sensitive user data)

### Permissions
The app requests minimal permissions:
- **INTERNET**: For in-app purchases only
- **VIBRATE**: For haptic feedback
- **BILLING**: For in-app purchase support

### Third-Party Dependencies
We regularly review our dependencies for security vulnerabilities:
- Flutter and Dart SDK
- Flame game engine
- Provider for state management
- All packages listed in `pubspec.yaml`

Run `flutter pub outdated` to check for updates.

## Security-Related Configuration

### analysis_options.yaml
We use Flutter's recommended lints to catch potential issues:
- Code quality checks
- Security-related warnings
- Best practice enforcement

### .gitignore
Configured to prevent committing:
- API keys and secrets
- Local configuration files
- Build artifacts with embedded data

## Vulnerability Disclosure Policy

We follow responsible disclosure:
- **Grace Period**: 90 days from initial report before public disclosure
- **Credit**: Security researchers are credited in release notes (if desired)
- **Coordination**: We coordinate with affected parties before disclosure

## Bug Bounty Program

Currently, Sol does not have a bug bounty program. However, we greatly appreciate security researchers who report vulnerabilities responsibly and will credit them in our security acknowledgments.

## Security Hall of Fame

We recognize contributors who help improve Sol's security:

*No security issues have been reported yet.*

## Questions?

For questions about this security policy, please open a discussion on GitHub or contact the maintainers.

## Updates to This Policy

This security policy may be updated from time to time. Check back regularly for changes.

**Last Updated**: February 9, 2026
