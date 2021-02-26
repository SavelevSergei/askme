module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def declination(num, one, two, three)
    last_digits = num % 10

    return three if (11..14).include?(num % 100)

    return one if last_digits == 1

    return two if last_digits.between?(2, 4)

    three
  end
end
