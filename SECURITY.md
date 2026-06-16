# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in MomCare, please email aadityaa.17079@gmail.com instead of using the issue tracker.

Please include:
* Description of the vulnerability
* Steps to reproduce
* Potential impact
* Suggested fix (if any)

## Security Practices

### Local Data Storage
- All user data is stored locally in SQLite
- No data is sent to external servers
- Database is encrypted at rest

### Biometric Authentication
- Optional fingerprint/face authentication
- Secure credential storage
- Uses platform-native security

### Permissions
- Only necessary permissions are requested
- Users can revoke permissions at any time
- Clear explanation for each permission

## Dependencies

We regularly update dependencies to patch security vulnerabilities. All dependencies are vetted for security.

## Responsible Disclosure

We ask that security researchers:
1. Do not publicly disclose the vulnerability until a fix is available
2. Give us reasonable time to address the issue
3. Work with us constructively

Thank you for helping keep MomCare secure!
