namespace api.Application.Venues;

public sealed record VenueCardDto(
    Guid Id,
    string Name,
    string Address,
    string GroundType,
    string PitchType,
    IReadOnlyList<string> AvailableSlots
);
