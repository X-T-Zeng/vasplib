function [outstring,outnumber] = grep(filename, pattern,mode)
    %-ģ��unix��grepָ��
    %-filename����������·��
    %-pattern:ƥ����ʽ
    if nargin<3
        mode = 'aloud';
    end
    fid = fopen(filename, 'r');
    line_number = 0;
    outstring = [""];
    outnumber = [];
    %-fgets �� fgetl �� �ɴ��ļ���ȡ��Ϣ
    while feof(fid) == 0
        line = fgetl(fid);
        line_number = line_number + 1;
        matched = findstr(line, pattern);
        if ~isempty (matched)
            %-�����ʽ�� �кţ���Ӧ������
            if strcmp(mode,'aloud')
                fprintf('%d: %s \n', line_number,line);
            end
            outstring = [outstring ;line];
            outnumber = [outnumber;line_number];
        end

    end
    outstring(1,:) = [];
    fclose(fid);
end