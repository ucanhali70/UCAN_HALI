namespace api.Domain.Venues;

public sealed record Venue(
    Guid Id,
    string Name,
    string Address,
    string GroundType,
    string PitchType,
    IReadOnlyList<string> AvailableSlots
);
