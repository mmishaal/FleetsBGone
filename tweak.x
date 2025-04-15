#import "NAJMAddVehicleTextFieldTableViewCell.h"

@implementation NAJMAddVehicleTextFieldTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI {
    self.textField.delegate = self;
    self.imgDownArrow.image = [UIImage imageNamed:@"ic_down_arrow"]; // تأكد من وجود الصورة في الأصول
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(textFieldCell:didEndEditingWithText:)]) {
        [self.delegate textFieldCell:self didEndEditingWithText:textField.text];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([self.delegate respondsToSelector:@selector(textFieldCell:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.delegate textFieldCell:self shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(textFieldCellShouldBeginEditing:)]) {
        return [self.delegate textFieldCellShouldBeginEditing:self];
    }
    return YES;
}

@end