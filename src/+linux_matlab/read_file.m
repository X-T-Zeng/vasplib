function [outstring] = read_file(filename)
import linux_matlab.*
    fid = fopen(filename, 'r');
    line_number = 0;
    outstring = [""];
    %-fgets �� fgetl �� �ɴ��ļ���ȡ��Ϣ
    while feof(fid) == 0
        line = fgetl(fid);
        outstring = [outstring ;line];
    end
    outstring(1,:) = [];
    fclose(fid);
end