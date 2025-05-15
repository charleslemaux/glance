# Glance Project Rules

## Project Overview
Glance is a Flutter application that uses AppWrite for backend services and Shadcn Flutter for component library and theming.

## Technology Stack

### Frontend
- **Framework**: Flutter
- **UI Component Library**: Shadcn Flutter (official version)
- **Theming**: Based on a custom color palette (currently using shades of brown and beige)
- **UI Effects**: Glassmorphism for card components
- **Fonts**: Google Fonts (Poppins)
- **Animations**: Lottie for animations

### Backend
- **Service**: AppWrite
- **Authentication**: Email/Password authentication via AppWrite
- **Project ID**: 67fedca9000be61c2419
- **Endpoint**: https://api.yousearch.fr/v1

## Code Structure

### Directory Organization
- `/lib`: Main source code
  - `/screens`: UI screens (login, home, splash, etc.)
  - `/widgets`: Reusable UI components
  - `/services`: Business logic and API services
  - `/utils`: Utility functions and configurations

### Naming Conventions
- **Files**: snake_case (e.g., `home_screen.dart`, `app_button.dart`)
- **Classes**: PascalCase (e.g., `HomeScreen`, `AppButton`)
- **Variables/Functions**: camelCase (e.g., `userEmail`, `checkAuthStatus()`)
- **Constants**: UPPER_CASE or camelCase depending on scope

## UI/UX Guidelines

### Design System
- Use the Shadcn Flutter component library for consistent UI elements
- Follow the custom color palette (currently shades of brown and beige)
- Border radius: 0.5 (as defined in ThemeData)

### Custom Components
- **AppBackground**: Gradient background for all screens
- **GlassmorphicCard**: Translucent card with blur effect
- **AppButton**: Standardized button with loading state
- **AppTextStyles**: Centralized text styling

### Text Styles
- Use predefined styles from AppTextStyles:
  - `appBarTitle`: For app bar titles
  - `heading`: For main headings (36px, bold)
  - `subHeading`: For secondary headings (24px, bold)
  - `body`: For body text (16px)
  - `buttonText`: For button labels

### Colors
- Primary gradient (example from AppBackground, can be expanded):
  - Light Beige (#F1DEC9)
  - Dark Brown (#8D7B68)
- Accent Colors (examples, can be expanded):
  - Medium Brown (#A4907C)
  - Light Brown (#C8B6A6)
- Text colors: Dark brown (e.g., #8D7B68) or off-black for primary text, lighter browns or grays for secondary text, ensuring contrast with the background.

## State Management
- Use Provider pattern for state management
- AuthProvider for handling authentication state

## Error Handling
- Implement proper error handling for AppWrite exceptions
- Display user-friendly error messages
- Include connectivity checks with InternetConnection

## Performance Guidelines
- Minimize widget rebuilds
- Use const constructors where possible
- Implement proper loading states for async operations

## Testing
- Write unit tests for services
- Write widget tests for UI components
- Implement integration tests for critical user flows

## Deployment
- Remove self-signed certificate in production
- Ensure proper error handling in production builds
- Implement proper logging for production issues

## Git Workflow
- Use feature branches for new features
- Create pull requests for code reviews
- Write meaningful commit messages

## Documentation
- Document complex logic with comments
- Keep README updated with setup instructions
- Document API integrations and authentication flow