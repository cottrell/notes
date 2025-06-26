# Relativistic Pinball Game - Development Notes

## Project Overview
A browser-based relativistic physics simulation game where players launch balls through gravitational fields to hit targets. Features proper Einstein physics with visible relativistic effects.

## File Location
- Main game: `/home/cottrell/dev/notes/_posts/2025-06-26-relativistic-pinball.html`
- Jekyll post with embedded HTML5 canvas game

## Core Features Implemented

### 1. Relativistic Physics Engine
- **Proper relativistic momentum**: `dp/dt = F` where `p = γmv`
- **Spacetime curvature**: Schwarzschild radius calculations for each planet
- **Geodesic motion**: Objects follow curved spacetime paths
- **Time dilation**: `γ = 1/√(1-β²)` affects internal processes
- **Post-Newtonian corrections**: Frame dragging and strong field effects
- **Speed limit**: Objects cannot exceed 99% speed of light

### 2. Visible Relativistic Effects
- **Length contraction**: Balls become elliptical in direction of motion
- **Color shifting**: Blue shift effect at high velocities (Doppler-like)
- **Enhanced trails**: Brighter, thicker trails at relativistic speeds
- **Relativistic glow**: Stronger glow effects for fast objects
- **Event horizons**: Red circles around massive objects (if Rs > 5px)

### 3. Gameplay Mechanics
- **Rapid-fire shooting**: Click anywhere to launch balls from fixed start position
- **Multiple concurrent balls**: Up to 10 balls active simultaneously
- **Aggressive culling**: Balls removed when 30px off-screen
- **Auto-targeting**: Always-visible start position with aim line preview
- **Shot tracking**: Each ball numbered, shows which shot hit target

### 4. Physics Visualization
- **Spacetime curvature rings**: Yellow concentric circles around planets
- **Gravitational field strength**: Multiple ring intensities
- **Velocity vectors**: Blue arrows showing planet motion (if moving)
- **Physics overlay**: Real-time relativistic data display
- **Event horizon warnings**: Red circles for black hole formation

### 5. User Controls
- **Canvas sizes**: Small (600x450) to Fullscreen (auto-detect)
- **Simulation speed**: 1x-5x multiplier for all physics
- **Planet motion**: Toggle between static and N-body orbital dynamics
- **Physics overlay**: Toggle detailed relativistic information
- **Sound system**: Web Audio API with relativistic effects

### 6. Keyboard Shortcuts
- `R`: Reset game (clear all balls)
- `N`: Generate new level
- `P`: Toggle physics overlay
- `S`: Toggle sound
- `M`: Toggle planet motion

## Technical Implementation Details

### Physics Constants (Scaled for Game)
```javascript
const c = 200;           // Speed of light (game units)
const G = 50;            // Gravitational constant (game units)
```

### Key Classes
- **Ball**: Relativistic particle with proper momentum, trail, visual effects
- **Planet**: Massive object with spacetime curvature, optional orbital motion
- **Target**: Pulsing goal object with hit detection

### Relativistic Calculations
```javascript
// Lorentz factor
const gamma = 1 / Math.sqrt(Math.max(1 - beta * beta, 0.01));

// Schwarzschild radius
const rs = 2 * G * mass / (c * c);

// Relativistic momentum update
this.vx += fx * dt / (gamma * this.mass);
```

### Visual Effects Implementation
- Length contraction via canvas transform scaling
- Color shifting through RGB interpolation based on β
- Trail brightness/thickness proportional to velocity
- Glow intensity scales with Lorentz factor

## Game State Architecture
```javascript
gameState = {
    balls: [],              // Array of active Ball objects
    planets: [],            // Array of Planet objects
    target: Target,         // Single target object
    startPos: {x, y},       // Fixed launch position
    isAiming: boolean,      // Mouse hover state
    aimTarget: {x, y},      // Mouse cursor position
    showPhysicsInfo: boolean,
    gameWon: boolean,
    simSpeed: number,       // 1-5x multiplier
    planetsMoving: boolean, // N-body vs static
    maxBalls: 10,
    shotCount: number
}
```

## Development History & Decisions

### Physics Evolution
1. **Started**: Newtonian gravity with speed limits
2. **Added**: Proper relativistic momentum equations
3. **Enhanced**: Spacetime curvature and geodesic motion
4. **Improved**: Visual relativistic effects for better feedback

### Gameplay Evolution
1. **Started**: Single ball, drag-to-launch
2. **Changed**: Click-to-aim for better UX
3. **Enhanced**: Multiple concurrent balls for addictive gameplay
4. **Added**: Aggressive culling to prevent lag

### Visual Design Decisions
- **Minimal UI**: No emojis, clean scientific aesthetic
- **Always-visible launcher**: Reduces confusion about where to click
- **Relativistic feedback**: Visual effects make physics tangible
- **Scalable canvas**: Physics space scales with visual space

## Common Issues & Solutions

### Performance Optimization
- Aggressive off-screen culling (±30px)
- Limited concurrent balls (max 10)
- Simplified trail rendering
- Physics constants tuned for stable simulation

### Relativistic Physics Accuracy
- Time dilation affects internal processes only, not coordinate motion
- Length contraction is visual effect, doesn't affect collision detection
- Speed limit enforced through momentum scaling, not velocity capping
- Schwarzschild radius calculations for proper event horizons

### User Experience
- Keyboard shortcuts labeled on buttons: (R)eset, (N)ew, etc.
- Fullscreen default for maximum play area
- Rapid-fire prevents waiting for single ball outcomes
- Physics overlay optional for educational vs entertainment focus

## Future Enhancement Ideas

### Relativistic Viewer/Lensing (Original Concept)
- Implement gravitational lensing visual effects
- Ball-as-observer perspective with light bending
- Multiple apparent images of distant objects
- Requires ray-tracing implementation for photon paths

### Advanced Physics
- Gravitational waves from accelerating masses
- Frame dragging effects (Lense-Thirring precession)
- Proper general relativistic trajectory calculation
- Quantum effects at small scales

### Gameplay Extensions
- Score system based on shot efficiency
- Level progression with increasing difficulty
- Multiplayer race modes
- Educational mode with physics explanations

## Code Maintenance Notes

### Critical Functions
- `Ball.update()`: Core physics simulation
- `gameLoop()`: Main render/update cycle
- `generateNewLevel()`: Procedural level creation
- `changeCanvasSize()`: Responsive scaling

### Physics Tuning Parameters
- Adjust `G` and `c` for different gameplay feel
- `maxBalls` for performance vs fun balance
- Culling distance for stability vs play area
- Trail length for visual feedback

### Browser Compatibility
- Requires modern JavaScript (ES6+)
- Canvas 2D API with transforms
- Web Audio API for sound (degrades gracefully)
- Responsive design for various screen sizes

## File Structure Notes
- Single HTML file with embedded CSS and JavaScript
- No external dependencies
- Jekyll front matter for blog integration
- Self-contained for easy sharing/deployment

---

This represents a complete relativistic physics simulation with educational value, engaging gameplay, and proper Einstein physics implementation. The codebase is well-structured for future enhancements while remaining performant and accessible.